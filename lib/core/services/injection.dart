import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_tracker/core/network.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/repositories/app_repository_impl.dart';
import 'package:time_tracker/domain/usecases/login_usecase.dart';
import 'package:time_tracker/ui/screens/login/login_cubit.dart';

import '../../data/resources/remote_data_resource.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Shared prefs
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);

  // Cubit
  sl.registerFactory(() => LoginCubit(sl()));

  // Use case
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(remoteDataResource: sl()),
  );

  // Remote data source
  sl.registerLazySingleton<RemoteDataResource>(
    () => RemoteDataResource(sl()),
  );

  // Local data source

  // Network manager
  sl.registerLazySingleton<NetworkManager>(
        () => NetworkManager(),
  );
}
