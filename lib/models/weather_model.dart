class WeatherModel {
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String cityName;
  final String condition;
  final String imageUrl;
  final DateTime date;

  WeatherModel({
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.cityName,
    required this.condition,
    required this.imageUrl,
    required this.date,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json['main']['temp'].toDouble(),
      minTemp: json['main']['temp_min'].toDouble(),
      maxTemp: json['main']['temp_max'].toDouble(),
      cityName: json['name'],
      condition: json['weather'][0]['main'],
      imageUrl: 'https://openweathermap.org/img/wn/${json['weather'][0]['icon']}@2x.png',
      date: DateTime.now(),
    );
  }
}
