import 'package:flutter/material.dart';
import 'package:wather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherModel;
  String? cityName;
  set weatherModel (WeatherModel? weatherModel){
    _weatherModel = weatherModel;
    notifyListeners();
  }
  WeatherModel? get weatherModel => _weatherModel;
}