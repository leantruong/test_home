import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_home/shared/domain/models/either.dart';
import 'package:test_home/shared/domain/models/paginated_response.dart';
import 'package:test_home/shared/domain/models/person/person_response.dart';
import 'package:test_home/shared/exceptions/http_exception.dart';
import 'package:test_home/shared/global.dart';

import '../../../domain/repositories/person_repository.dart';
import 'person_state.dart';

class PersonNotifier extends StateNotifier<PersonState> {
  final PersonRepository personRepository;

  PersonNotifier(
    this.personRepository,
  ) : super(const PersonState.initial());

  bool get isFetching =>
      state.state != PersonFetchState.loading &&
      state.state != PersonFetchState.fetchingMore;

  Future<void> fetchPersons({bool isRefresh = false}) async {
    if (isRefresh) {
      resetState();
    }
    if (isFetching) {
      state = state.copyWith(
        state: state.page > 0
            ? state.page > 3
                ? PersonFetchState.completeFetchingMore
                : PersonFetchState.fetchingMore
            : PersonFetchState.loading,
        isLoading: true,
      );

      final response = await personRepository.fetchPersons();
      updateStateFromResponse(response);
    }
  }

  void updateStateFromResponse(
      Either<AppException, PaginatedResponse<dynamic>> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: PersonFetchState.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      final personList =
          data.data.map((e) => PersonResponse.fromJson(e)).toList();

      final allPersons = [...state.personList, ...personList];

      state = state.copyWith(
        personList: allPersons,
        state: PersonFetchState.loaded,
        hasData: true,
        message: allPersons.isEmpty ? 'No person found' : '',
        page: allPersons.length ~/ PERSONS_PER_PAGE,
        total: data.total,
        isLoading: false,
      );
    });
  }

  void resetState() {
    state = const PersonState.initial();
  }
}
