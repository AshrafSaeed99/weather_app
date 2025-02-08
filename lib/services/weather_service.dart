import 'dart:developer';

import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  WeatherService({required this.dio});

  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '3ed52d15d137442f933130536242712';

  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      String message = e.response?.data['error']['message'] ?? 'City not found. Please enter a valid city name.';
      throw Exception(message);
    } catch (e) {
      log(e.toString());
      throw Exception('oops something went wrong\n${e.toString()}');
    }
  }
}
