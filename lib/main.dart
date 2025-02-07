import 'package:flutter/material.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
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
    return  BlocProvider(
         create: (context) => WeatherCubit(),
         child: MaterialApp(
               routes: {
                 HomeView.routeName: (context) => const HomeView(),
                 SearchView.routeName: (context) => const SearchView(),
               },
               debugShowCheckedModeBanner: false,
               initialRoute: HomeView.routeName,
             ),
       
    );
  }
}
MaterialColor getWeatherColor(String weatherText) {
  final text = weatherText.toLowerCase();

  // 1. حالات مشمسة وواضحة
  if (text.contains('sunny') || text.contains('clear')) {
    return Colors.orange;
  }
  // 2. حالات غائمة جزئياً أو عامة
  else if (text.contains('partly cloudy') ||
           text.contains('cloudy') ||
           text.contains('overcast')) {
    return Colors.blueGrey;
  }
  // 3. حالات ضبابية أو ضباب
  else if (text.contains('mist') ||
           text.contains('fog') ||
           text.contains('freezing fog')) {
    return Colors.grey;
  }
  // 4. حالات مطرية وعواصف (يشمل المطر والرياح والعواصف الرعدية)
  else if (text.contains('rain') ||
           text.contains('drizzle') ||
           text.contains('thunder')) {
    return Colors.blue;
  }
  // 5. حالات ثلجية (يشمل الثلج والعواصف الثلجية والبرد)
  else if (text.contains('snow') ||
           text.contains('sleet') ||
           text.contains('blizzard') ||
           text.contains('ice pellets')) {
    return Colors.cyan;
  }
  
  // في حال عدم تطابق أي حالة أعلاه، نعيد لون افتراضي
  return Colors.green;
}
