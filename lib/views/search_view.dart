import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
static const routeName = '/search';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorLight,
            
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        )),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName: value);
              Navigator.pop(context, value);
            },
            style: TextStyle(fontSize: 26, color: Colors.black),
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: 'Search',
              labelStyle: TextStyle(color: Colors.black, fontSize: 24),
              hintText: 'Enter City Name',
              hintStyle: TextStyle(fontSize: 24),
              
              suffixIcon: const Icon(Icons.search,size: 32,),
              focusedBorder: OutlineInputBorder(
          
              ),
            ),
          autofocus: true,
          ),
        ),
      ),
    );
  }
}