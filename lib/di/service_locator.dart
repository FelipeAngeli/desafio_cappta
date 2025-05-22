import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/network/api_client.dart';
import '../core/network/interceptors/curllogger_dio_interceptor.dart';
import '../data/repository/pokemon_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(CurlLoggerDioInterceptor(
    1,
    'PokemonClient',
  ));

  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<Dio>()));

  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepository(getIt<ApiClient>()),
  );
}
