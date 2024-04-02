import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../models/card/card_model.dart';

abstract class ICardDataSource {
  Future<List<CarModel>> getVehicles();

  Future<void> postLead(CarModel car);
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

  @override
  Future<void> postLead(CarModel car) async {
    try {
      var url = Uri.parse('https://www.wswork.com.br/cars/leads');
      var client = http.Client();
      var request = http.Request('POST', url)
        ..headers['Content-Type'] = 'application/json'
        ..body = json.encode(car.toJson());

      var response = await client.send(request);

      if (response.statusCode == 301 || response.statusCode == 302 || response.statusCode == 307) {

        var redirectUrl = response.headers['location'];
        if (redirectUrl != null) {
          url = Uri.parse(redirectUrl);
          request = http.Request('GET', url)
            ..headers['Content-Type'] = 'application/json'
            ..body = json.encode(car.toJson());

          response = await client.send(request);
        }
      }

      if (response.statusCode == 200) {

        if (kDebugMode) {
          print('Lead posted successfully');
        }
      } else {

        throw Exception('Failed to post lead. Status code: ${response.statusCode}');
      }

    } catch (e) {
      throw Exception('Failed to post lead: $e');
    }
  }
}
