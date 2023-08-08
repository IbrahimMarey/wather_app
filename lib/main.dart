import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:wather_app/models/weather_model.dart';
import 'package:wather_app/moduls/home_page.dart';
import 'package:wather_app/providers/weather_provider.dart';
import 'package:wather_app/services/weather_service.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherCubit(WeatherService()),
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  WeatherModel? model;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch:BlocProvider.of<WeatherCubit>(context).weatherModel==null ?
         Colors.blue : BlocProvider.of<WeatherCubit>(context)
             .weatherModel!
            .getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
