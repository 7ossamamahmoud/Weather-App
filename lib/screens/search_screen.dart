import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

import '../components/icons/icon_broken.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a city",
          style: TextStyle(
            fontFamily: "Pacifico",
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          children: [
            TextFormField(
              onFieldSubmitted: (value) async {
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getCurrentWeather(cityName: value);
                Navigator.pop(context);
              },
              /*validator: (value) {
                if (value == null || value.isEmpty) {
                  'Please enter your city to estimate the weather conditions';
                }
                return null;
              },*/
              /*
              onChanged: (text) {
                _textController.value = _textController.value.copyWith(
                  text: text,
                  selection: TextSelection.fromPosition(
                    TextPosition(
                      offset: text.length,
                    ),
                  ),
                );
              },
*/
              focusNode: FocusNode(descendantsAreFocusable: true),
              controller: _textController,
              maxLines: 1,
              style: const TextStyle(
                textBaseline: TextBaseline.alphabetic,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Amiri',
                letterSpacing: 1.02,
                wordSpacing: 1.1,
              ),
              decoration: const InputDecoration(
                labelText: 'Search a City',
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Pacifico",
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                hintText: 'Enter your city here...',
                hintTextDirection: TextDirection.ltr,
                prefixIcon: Icon(
                  IconBroken.Home,
                ),
                suffixIcon: Icon(
                  IconBroken.Search,
                ),
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Pacifico",
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
