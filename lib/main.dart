import 'package:flutter/material.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {          
          return MaterialApp(
              routes: {
                HomeView.routeName: (context) => const HomeView(),
                SearchView.routeName: (context) => const SearchView(),
              },
              debugShowCheckedModeBanner: false,
              initialRoute: HomeView.routeName,
              theme: ThemeData(
                primarySwatch: getWeatherColor(
                    BlocProvider.of<WeatherCubit>(context)
                            .weatherModel
                            ?.condition),
                        useMaterial3: false,    
              ),);
        },
      ),
    );
  }
}

MaterialColor getWeatherColor(String? weatherText) {
  if (weatherText == null) {
    return Colors.green;
  }
  final text = weatherText.toLowerCase();

  if (text.contains('sunny') || text.contains('clear')) {
    return Colors.orange;
  } else if (text.contains('partly cloudy') ||
      text.contains('cloudy') ||
      text.contains('overcast')) {
    return Colors.blueGrey;
  } else if (text.contains('mist') ||
      text.contains('fog') ||
      text.contains('freezing fog')) {
    return Colors.grey;
  } else if (text.contains('rain') ||
      text.contains('drizzle') ||
      text.contains('thunder')) {
    return Colors.blue;
  } else if (text.contains('snow') ||
      text.contains('sleet') ||
      text.contains('blizzard') ||
      text.contains('ice pellets')) {
    return Colors.cyan;
  }

  return Colors.green;
}
