import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_test/dio_interceptor.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static late Dio dio;

  static Future<void> init() async {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 5),
        baseUrl: 'https://catfact.ninja',
      ),
    )..interceptors.addAll(
        [
          DioSampleInterceptors(),
          if (kDebugMode)
            LogInterceptor(
              responseHeader: true,
              requestBody: true,
              responseBody: true,
              logPrint: (e) {
                log(e.toString());
              },
            ),
        ],
      );
  }
}
