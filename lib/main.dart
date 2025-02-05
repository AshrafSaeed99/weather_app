import 'package:flutter/material.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/views/search_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.routeName: (context) => const HomeView(),
        SearchView.routeName: (context) => const SearchView(),
      },
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
