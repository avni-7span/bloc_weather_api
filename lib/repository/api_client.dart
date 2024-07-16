import 'dart:convert';
import 'package:bloc_weather_api/repository/weather_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<WeatherModel?> getModel(String cityLocation) async {
    final url =
        'https://api.weatherapi.com/v1/current.json?q=$cityLocation&key=1bc3b2cbce2d424eb8a51410240107';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    try {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        // print('json type : ${json.runtimeType}');
        final model = WeatherModel.fromJson(json);
        return model;
        // print("aapdu model : $model");
      } else {
        print('else part : ${response.statusCode}');
      }
    } catch (e) {
      print('Exception is... : $e');
    }
    return null;
  }
}
