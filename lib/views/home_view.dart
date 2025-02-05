import 'package:flutter/material.dart';
import 'package:weather_app/widget/no_weather_widget.dart';
import 'package:weather_app/widget/weather_data_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search),iconSize: 32,)], 

      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 10,
      ),
      body: const WeatherDataWidget(),
    );
  }
}