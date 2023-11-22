import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_home/shared/data/remote/dio_service.dart';

final netwokServiceProvider = Provider<DioNetworkService>(
  (ref) {
    final Dio dio = Dio();
    return DioNetworkService(dio);
  },
);