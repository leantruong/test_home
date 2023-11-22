import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_home/features/person/data/datasource/person_remote_datasource.dart';
import 'package:test_home/features/person/data/repositories/dashboard_repository_imp.dart';
import 'package:test_home/features/person/domain/repositories/person_repository.dart';
import 'package:test_home/shared/data/remote/network_service.dart';
import 'package:test_home/shared/domain/providers/dio_network_service_provider.dart';

final personDatasourceProvider =
    Provider.family<PersonDatasource, NetworkService>(
  (_, networkService) => PersonRemoteDatasource(networkService),
);

final personsRepositoryProvider = Provider<PersonRepository>((ref) {
  final networkService = ref.watch(netwokServiceProvider);
  final datasource = ref.watch(personDatasourceProvider(networkService));
  final respository = PersonRepositoryImpl(datasource);

  return respository;
});
