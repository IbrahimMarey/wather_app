import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:wather_app/models/weather_model.dart';
import 'package:wather_app/providers/weather_provider.dart';
import 'package:wather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
   // SearchPage({Key? key}) : super(key: key);
  var controller = TextEditingController();
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('search a city'),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
              // onChanged: (v){
              //   print(v);
              // },
              onFieldSubmitted: (v)async{
                cityName = v;

                BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
                BlocProvider.of<WeatherCubit>(context).cityName=cityName;
                // WeatherService service = WeatherService();
                // WeatherModel model =await service.getWeather(cityName: cityName!);
                // Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
                // Provider.of<WeatherProvider>(context,listen: false).weatherModel = model;
                // weatherData = model;
                // updateUi!();
                Navigator.pop(context);
                // print(model.date.toString());
              },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 24,horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Enter City Name',
                ),
              ),

          ],
        ),
      ),
    );
  }
}
// WeatherModel? weatherData;