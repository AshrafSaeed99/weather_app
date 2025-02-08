import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    emit(WeatherLoadingState());

    try {
      weatherModel = await WeatherService(dio: Dio()).getWeather(cityName);
        emit(WeatherSuccessState(weatherModel: weatherModel!));      
    } catch (e) {
      emit(WeatherErrorState(errorMessage: e.toString()));
    }
  }
}
