import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tally_task/core/network/network_info.dart';
import 'package:tally_task/features/business/data/client/business_client.dart';
import 'package:tally_task/features/business/data/data_sources/local/business_local_data_source.dart';
import 'package:tally_task/features/business/data/data_sources/remote/business_remote_data_source.dart';
import 'package:tally_task/features/business/data/repositories_impl/business_repository_impl.dart';
import 'package:tally_task/features/business/domain/repositories/business_repository.dart';
import 'package:tally_task/features/business/domain/use_cases/get_business_detail_use_case.dart';
import 'package:tally_task/features/business/domain/use_cases/get_businesses_use_case.dart';
import 'package:tally_task/features/business/domain/use_cases/search_businesses_use_case.dart';
import 'package:tally_task/features/business/presentation/provider/business_provider.dart';
import 'package:tally_task/core/network/dio_client.dart';

final sl = GetIt.instance;

Future<void> initializeServiceLocator() async {
  //! Features -
  // Provider
  sl.registerFactory(
    () => BusinessProvider(
      getBusinesses: sl(),
      getBusinessDetail: sl(),
      searchBusinesses: sl(),
    ),
  );

  /// Use cases
  sl.registerLazySingleton(() => GetBusinessesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetBusinessDetailUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchBusinessesUseCase(repository: sl()));

  //! Repository
  sl.registerLazySingleton<BusinessRepository>(
    () => BusinessRepositoryImpl(remote: sl(), local: sl(), networkInfo: sl()),
  );

  // Data sources
  sl.registerLazySingleton<BusinessRemoteDataSource>(
    () => BusinessRemoteDataSourceImpl(client: sl<BusinessClient>()),
  );
  sl.registerLazySingleton<BusinessLocalDataSource>(
    () => BusinessLocalDataSourceImpl(pref: sl<SharedPreferences>()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl()),
  );

  //! External

  sl.registerLazySingleton(() => InternetConnectionChecker.instance);

  sl.registerLazySingleton<DioClient>(() => DioClient());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton<BusinessClient>(
    () => BusinessClient(sl<DioClient>().dio),
  );
}
