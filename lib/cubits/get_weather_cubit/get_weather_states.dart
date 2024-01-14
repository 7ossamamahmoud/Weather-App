import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherInfoLoadedSuccessfullyState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherInfoLoadedSuccessfullyState({
    required this.weatherModel,
  });
}

class WeatherInfoFailureState extends WeatherState {
  final String errorMessage;

  WeatherInfoFailureState({
    required this.errorMessage,
  });
}
