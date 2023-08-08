import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    // remove factory
    // date=             data['location']['localtime'];
    // temp=             jsonData['avgtemp_c'];
    // maxTemp=          jsonData['maxtemp_c'];
    // minTemp=          jsonData['mintemp_c'];
    // weatherStateName= jsonData['condition']['text'];
    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  String getImage(){
    if(weatherStateName == 'Clear'|| weatherStateName== 'Light Cloud'|| weatherStateName=='Sunny'){
      return 'assets/images/clear.png';
    }
    else {
      return 'assets/images/cloudy.png';
    }
  }
  MaterialColor getThemeColor(){
    if(weatherStateName == 'Clear'|| weatherStateName== 'Light Cloud'|| weatherStateName=='Sunny'){
      return Colors.orange;
    }
    else {
      return Colors.blue;
    }
  }
}
