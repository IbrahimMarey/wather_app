import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wather_app/cubits/weather_cubit/weather_state.dart';
import 'package:wather_app/models/weather_model.dart';
import 'package:wather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(this.weatherService) : super(InitialStateWeather());

  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;
  void getWeather({required String cityName})async
  {
    emit(LoadingWeather());
    try{
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(SuccessWeather());
    }catch(e){
      emit(ErrorWeather());
    }

  }
}