import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '778c0907123a4dc38d3124120231803';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    //&aqi=no&alerts=no
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
   // var jsonData =      data['forecast']['forecastday'][0];
    WeatherModel weatherModel = WeatherModel.fromJson(data);
    // WeatherModel weatherModel = WeatherModel(
    //   date:             data['location']['localtime'],
    //   temp:             jsonData['avgtemp_c'],
    //   maxTemp:          jsonData['maxtemp_c'],
    //   minTemp:          jsonData['mintemp_c'],
    //   weatherStateName: jsonData['condition']['text'],
    // );
   // print(weatherModel.date);
    return weatherModel;
  }
}
