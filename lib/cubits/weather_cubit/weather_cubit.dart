import 'package:bloc/bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit() : super(WeatherInitialState());
}