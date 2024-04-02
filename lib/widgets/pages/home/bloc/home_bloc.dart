import 'package:bloc/bloc.dart';
import 'package:car_app_test/models/card/card_model.dart';
import 'package:meta/meta.dart';

import '../../../../usecases/car/get_car_usecase.dart';
import '../../../../usecases/car/post_car_leads_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._getCarsUseCase,this._postCarsUseCase) : super(HomeInitial()) {
    on<FetchCars>(_fetchCars);
    on<PostLead>(_postLeadHandler);
  }

  final IGetCarUseCase _getCarsUseCase;
  final IPostCarUseCase _postCarsUseCase;

  Future<void> _fetchCars(FetchCars event, Emitter<HomeState> emit) async {
    try {
      emit(CarLoading());
      final cars = await _getCarsUseCase.getVehicles();
      emit(CarLoaded(cars));
    } catch (e) {
      emit(CarError(e.toString()));
    }
  }

  Future<void> _postLeadHandler(PostLead event, Emitter<HomeState> emit) async {
    emit(CarLoading());
    try {
      await _postCarsUseCase.postLead(event.car);
      emit(PostCardSuccess());
    } catch (e) {
      emit(CarError(e.toString()));
    }
    }
  }

