import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../models/card/card_model.dart';

abstract class ICardDataSource {
  Future<List<CarModel>> getVehicles();
}

class CardDataSource implements ICardDataSource {
  @override
  Future<List<CarModel>> getVehicles() async {
    try {
      final response = await http.get(Uri.parse('https://wswork.com.br/cars.json'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = jsonDecode(response.body);
        List<dynamic> data = decodedJson['cars'];
        return data.map((carJson) => CarModel.fromJson(carJson)).toList();
      } else {
        throw Exception('Failed to load cars');
      }
    } catch (e) {
      throw Exception('Failed to load cars');
    }
  }
}
