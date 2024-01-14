import 'package:flutter/material.dart';

class NoWeatherScreen extends StatelessWidget {
  const NoWeatherScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sorry, There is no weather info 😔',
              style: TextStyle(
                fontSize: 26,
                overflow: TextOverflow.ellipsis,
                fontFamily: "Pacifico",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Start Searching now',
                  style: TextStyle(
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: "Pacifico",
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.double,
                  ),
                ),
                Text(
                  ' 🔍',
                  style: TextStyle(
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: "Pacifico",
                    color: Colors.blue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
