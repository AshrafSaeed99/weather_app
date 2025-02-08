import 'package:flutter/material.dart';

class NoWeatherWidget extends StatelessWidget {
  const NoWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Center(
        child: Text(
          'No Weather Data😔\nStart Searching now🔍',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}