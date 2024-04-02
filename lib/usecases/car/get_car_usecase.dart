import 'package:car_app_test/repositories/car/car_repository.dart';

import '../../models/card/card_model.dart';

abstract class IGetCarUseCase {
  Future<List<CarModel>> getVehicles();
}

class GetCarUseCase implements IGetCarUseCase {
  const GetCarUseCase(this._carRepository);

  final ICarRepository _carRepository;

  @override
  Future<List<CarModel>> getVehicles() async {
    return _carRepository.getVehicles();
  }
}