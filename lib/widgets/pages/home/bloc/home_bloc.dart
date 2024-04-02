import 'package:bloc/bloc.dart';
import 'package:car_app_test/models/card/card_model.dart';
import 'package:meta/meta.dart';

import '../../../../usecases/car/get_car_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._getCarsUseCase) : super(HomeInitial()) {
    on<FetchCars>(_fetchCars);
  }

  final IGetCarUseCase _getCarsUseCase;

  Future<void> _fetchCars(FetchCars event, Emitter<HomeState> emit) async {
    try {
      emit(CarLoading());
      final cars = await _getCarsUseCase.getVehicles();
      emit(CarLoaded(cars));
    } catch (e) {
      emit(CarError(e.toString()));
    }
  }
}
