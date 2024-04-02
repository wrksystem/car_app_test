import 'package:car_app_test/repositories/car/car_repository.dart';
import 'package:car_app_test/repositories/car/data_sources/card_data_source.dart';
import 'package:car_app_test/usecases/car/get_car_usecase.dart';
import 'package:car_app_test/widgets/pages/auth/bloc/auth_bloc.dart';
import 'package:car_app_test/widgets/pages/home/bloc/home_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../repositories/auth/aurh_repository.dart';
import '../../repositories/auth/data_sources/auth_data_source.dart';
import '../../usecases/auth/login_usecase.dart';
import '../../usecases/auth/register_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Primeiro, configure os DataSources
  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  sl.registerLazySingleton<IAuthDataSource>(() => AuthDataSource(firebaseAuth: sl()));
  sl.registerSingleton<ICardDataSource>(CardDataSource());

  // Depois os Repositories
  sl.registerLazySingleton<IAuthRepository>(() => AuthRepository(sl()));
  sl.registerFactory<ICarRepository>(() => CarRepository(sl()));

  // Em seguida, os UseCases
  sl.registerFactory<IGetCarUseCase>(() => GetCarUseCase(sl()));
  sl.registerFactory<IRegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerFactory<ILoginUseCase>(() => LoginUseCase(sl()));

  // E finalmente, os Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl<ILoginUseCase>(), sl<IRegisterUseCase>()));
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
}
