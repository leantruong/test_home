import 'package:test_home/shared/domain/models/either.dart';
import 'package:test_home/shared/domain/models/paginated_response.dart';
import 'package:test_home/shared/exceptions/http_exception.dart';

abstract class PersonRepository {
  Future<Either<AppException, PaginatedResponse>> fetchPersons();
}
