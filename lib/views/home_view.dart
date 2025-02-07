import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/views/search_view.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchView.routeName);
            },
            icon: const Icon(Icons.search),
            iconSize: 32,
          )
        ],
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 10,
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const Center(
              child: NoWeatherWidget(),
            );
          } else if (state is WeatherErrorState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text('oops something went wrong.\n${state.errorMessage}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            );
          } else if (state is WeatherSuccessState) {
            return WeatherDataWidget(
              weatherModel: state.weatherModel,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
