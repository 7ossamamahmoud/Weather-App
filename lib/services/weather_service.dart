import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String apiKey = '9e2ab7bc9d6540fd887213430230712';
  final String baseUrl = 'https://api.weatherapi.com/v1';

  WeatherService({required this.dio});

  Future<WeatherModel> getWeatherInfo({
    required String cityName,
  }) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error']['message'] ??
          'Oops, there was a Dio error, please try later';
      print(errorMessage);
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops, there was an error, please try later again');
    }
  }
}
