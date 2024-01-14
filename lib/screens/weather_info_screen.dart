import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoScreen extends StatelessWidget {
  final WeatherModel model;

  const WeatherInfoScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getThemeColor(
            condition: weatherModel.weather_status,
          ),
          getThemeColor(
            condition: weatherModel.weather_status,
          )[300]!,
          getThemeColor(
            condition: weatherModel.weather_status,
          )[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            weatherModel.weather_image!.contains("https")
                ? CircleAvatar(
                    radius: 74,
                    backgroundColor: Colors.black45,
                    child: CircleAvatar(
                      foregroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        weatherModel.weather_image!,
                      ),
                      radius: 71,
                    ),
                  )
                : CircleAvatar(
                    radius: 78,
                    backgroundColor: Colors.black45,
                    child: CircleAvatar(
                      foregroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        "https:${weatherModel.weather_image!}",
                      ),
                      radius: 75,
                    ),
                  ),
            const Spacer(
              flex: 1,
            ),
            Text(
              weatherModel.city_Name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  letterSpacing: 1.9,
                  fontFamily: "Pacifico"),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Updated at: ${weatherModel.Last_Updated_date.hour}:${weatherModel.Last_Updated_date.minute}",
              style: const TextStyle(
                fontSize: 24,
                fontFamily: "Pacifico",
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '${weatherModel.avg_temperature.round()} c°',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    fontFamily: "Pacifico",
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Max.temp: ${weatherModel.max_temperature.round()} c°',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Pacifico",
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Min.temp: ${weatherModel.min_temperature.round()} c°',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Pacifico",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weather_status,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                fontFamily: "Pacifico",
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
