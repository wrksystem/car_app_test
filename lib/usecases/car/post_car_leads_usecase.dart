import 'package:car_app_test/repositories/car/car_repository.dart';

import '../../models/card/card_model.dart';

abstract class IPostCarUseCase {
  Future<void> postLead(CarModel car);
}

class PostCarUseCase implements IPostCarUseCase {
  const PostCarUseCase(this._carRepository);

  final ICarRepository _carRepository;

  @override
  Future<void> postLead(CarModel car) async {
    return _carRepository.postLead(car);
  }
}