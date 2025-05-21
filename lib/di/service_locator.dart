import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/network/api_client.dart';
import '../core/network/interceptors/curllogger_dio_interceptor.dart';
import '../data/repositories/pokemon_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://pokeapi.co/api/v2/',
  ));

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
