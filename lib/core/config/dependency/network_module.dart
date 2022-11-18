import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../contants/constants.dart';
import 'interceptors.dart';

@module
abstract class NetworkModule {
  // internet connection checker

  @lazySingleton
  Dio dio(DioInterceptors dioInterceptors) {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppContants.restBaseUrl,
        contentType: "application/json",
        // connectTimeout: 30000,
      ),
    );
    dio.interceptors.addAll([
      dioInterceptors,
      // LogInterceptor(responseBody: false),
      //   PrettyDioLogger(
      //     requestHeader: true,
      //     requestBody: true,
      //     responseBody: true,
      //     responseHeader: false,
      //     compact: false,
      //   )
    ]);
    return dio;
  }
}
