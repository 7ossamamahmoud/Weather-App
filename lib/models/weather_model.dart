class WeatherModel {
  final String city_Name;
  final DateTime Last_Updated_date;
  final double avg_temperature;
  final double max_temperature;
  final double min_temperature;
  final String? weather_image;
  final String weather_status;

  WeatherModel({
    required this.city_Name,
    required this.Last_Updated_date,
    required this.avg_temperature,
    required this.max_temperature,
    required this.min_temperature,
    this.weather_image,
    required this.weather_status,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      city_Name: json['location']['name'],
      Last_Updated_date: DateTime.parse(json['current']['last_updated']),
      avg_temperature: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      max_temperature: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      min_temperature: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weather_image: json['forecast']['forecastday'][0]['day']['condition']
          ['icon'],
      weather_status: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
