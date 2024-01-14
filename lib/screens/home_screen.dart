import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather_info_screen.dart';
import 'package:weather_app/screens/weather_no_body_screen.dart';

import '../components/icons/icon_broken.dart';

class WeatherHomeScreen extends StatelessWidget {
  const WeatherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Weather App",
            style: TextStyle(
              fontFamily: "Pacifico",
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          leading: const Icon(
            Icons.sunny_snowing,
            size: 30,
            color: Colors.white,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 7,
                right: 16.0,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  IconBroken.Search,
                ),
              ),
            )
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return const NoWeatherScreen();
            } else if (state is WeatherInfoLoadedSuccessfullyState) {
              print("Successfully loaded");
              return WeatherInfoScreen(
                model: state.weatherModel,
              );
            } else {
              print("Failure loading");
              return const Center(
                child: Text(
                  "Oops!, there was a problem.",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Pacifico',
                  ),
                ),
              );
            }
          },
        ));
  }
}
