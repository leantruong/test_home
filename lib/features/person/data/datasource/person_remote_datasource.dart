import 'dart:convert';

import 'package:test_home/shared/data/remote/network_service.dart';
import 'package:test_home/shared/domain/models/either.dart';
import 'package:test_home/shared/domain/models/paginated_response.dart';
import 'package:test_home/shared/exceptions/http_exception.dart';
import 'package:test_home/shared/global.dart';

abstract class PersonDatasource {
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedPersons();
}

class PersonRemoteDatasource extends PersonDatasource {
  final NetworkService networkService;
  PersonRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, PaginatedResponse>>
      fetchPaginatedPersons() async {
    final response = await networkService.get(
      '/persons',
      queryParameters: {
        '_quantity': PERSONS_PER_PAGE,
        '_locale': 'en_US',
        '_gender': '',
      },
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = (r.data);
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchPaginatedData',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final paginatedResponse =
            PaginatedResponse.fromJson(jsonData, jsonData['data'] ?? []);
        return Right(paginatedResponse);
      },
    );
  }
}
