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
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json["forecast"]["forecastday"][0]['day']['avgtemp_c'],
      maxTemp: json["forecast"]["forecastday"][0]['day']['maxtemp_c'],
      minTemp: json["forecast"]["forecastday"][0]['day']["mintemp_c"],
      condition: json["forecast"]["forecastday"][0]['day']['condition']
          ["text"],
      imageUrl: json["forecast"]["forecastday"][0]['day']['condition']["icon"],
    );
  }
}
