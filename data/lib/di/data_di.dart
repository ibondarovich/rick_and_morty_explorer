import 'package:core/core.dart';
import 'package:dio/dio.dart';

import 'character/character_di.dart';

class DataDependencies {
  static void setup() {
    // Setup all data layer dependencies
    _setupCommonDependencies();
    
    // Setup feature-specific dependencies
    CharacterDependencies.setup();
  }

  static void _setupCommonDependencies() {
    // Register Dio with base configuration
    appLocator.registerLazySingleton<Dio>(
      () {
        final dio = Dio(
          BaseOptions(
            baseUrl: 'https://rickandmortyapi.com/api/',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        );

        // Add interceptors if needed
        // dio.interceptors.add(LogInterceptor(
        //   requestBody: true,
        //   responseBody: true,
        // ));


        return dio;
      },
    );
  }
}
