import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherDataWidget extends StatelessWidget {
  const WeatherDataWidget({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          weatherModel.cityName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        Text(
          'Udated at: ${weatherModel.date.hour}:${weatherModel.date.minute}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 40),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, 
        children: [
          Image.network(
            weatherModel.imageUrl.contains('https:')?
            weatherModel.imageUrl: 'https:${weatherModel.imageUrl}',
          ),
          Text(
            weatherModel.temp.round().toString(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Column(children: [
            Text(
              'maxTemp: ${weatherModel.maxTemp.round()}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Text(
              'minTemp: ${weatherModel.minTemp.round()}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ])
        ]),
        const SizedBox(height: 40),
        Text(
          weatherModel.condition,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
