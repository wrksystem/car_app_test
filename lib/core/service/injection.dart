import 'package:car_app_test/repositories/car/car_repository.dart';
import 'package:car_app_test/repositories/car/data_sources/card_data_source.dart';
import 'package:car_app_test/usecases/car/get_car_usecase.dart';
import 'package:car_app_test/widgets/pages/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../usecases/car/post_car_leads_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Configure o CarDataSource
  sl.registerSingleton<ICardDataSource>(CardDataSource());

  // Configure o CarRepository
  sl.registerFactory<ICarRepository>(() => CarRepository(sl()));

  // Configure o GetCarsUseCase
  sl.registerFactory<IGetCarUseCase>(() => GetCarUseCase(sl()));
  sl.registerFactory<IPostCarUseCase>(() => PostCarUseCase(sl()));

  // Configure o CarBloc
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl(),sl()));
}
