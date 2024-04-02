import 'package:car_app_test/repositories/car/data_sources/card_data_source.dart';

import '../../models/card/card_model.dart';

abstract class ICarRepository {
  Future<List<CarModel>> getVehicles();

  Future<void> postLead(CarModel car);
}

class CarRepository implements ICarRepository {
  const CarRepository(this._cardDataSource);

  final ICardDataSource _cardDataSource;

  @override
  Future<List<CarModel>> getVehicles() async {
    return _cardDataSource.getVehicles();
  }

  @override
  Future<void> postLead(CarModel car) async {
    return _cardDataSource.postLead(car);
  }
}