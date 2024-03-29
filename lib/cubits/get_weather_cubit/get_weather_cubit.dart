import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;

  getCurrentWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(dio: Dio()).getWeatherInfo(
        cityName: cityName,
      );
      emit(WeatherInfoLoadedSuccessfullyState(
        weatherModel: weatherModel!,
      ));
    } catch (e) {
      emit(
        WeatherInfoFailureState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
