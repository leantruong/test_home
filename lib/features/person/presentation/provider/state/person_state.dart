// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:test_home/shared/domain/models/person/person_response.dart';

enum PersonFetchState {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  completeFetchingMore,
}

class PersonState extends Equatable {
  final List<PersonResponse> personList;
  final int total;
  final int page;
  final bool hasData;
  final PersonFetchState state;
  final String message;
  final bool isLoading;
  const PersonState({
    this.personList = const [],
    this.isLoading = false,
    this.hasData = false,
    this.state = PersonFetchState.initial,
    this.message = '',
    this.page = 0,
    this.total = 0,
  });

  const PersonState.initial({
    this.personList = const [],
    this.total = 0,
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.state = PersonFetchState.initial,
    this.message = '',
  });

  PersonState copyWith({
    List<PersonResponse>? personList,
    int? total,
    int? page,
    bool? hasData,
    PersonFetchState? state,
    String? message,
    bool? isLoading,
  }) {
    return PersonState(
      isLoading: isLoading ?? this.isLoading,
      personList: personList ?? this.personList,
      total: total ?? this.total,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'PersonState(isLoading:$isLoading, productLength: ${personList.length},total:$total page: $page, hasData: $hasData, state: $state, message: $message)';
  }

  @override
  List<Object?> get props => [personList, page, hasData, state, message];
}
