

import 'package:test_home/shared/domain/models/either.dart';
import 'package:test_home/shared/domain/models/paginated_response.dart';
import 'package:test_home/shared/exceptions/http_exception.dart';

import '../../domain/repositories/person_repository.dart';
import '../datasource/person_remote_datasource.dart';

class PersonRepositoryImpl extends PersonRepository {
  final PersonDatasource personDatasource;
  PersonRepositoryImpl(this.personDatasource);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchPersons(
      ) {
    return personDatasource.fetchPaginatedPersons();
  }

 
}