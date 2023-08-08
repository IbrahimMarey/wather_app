import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:wather_app/cubits/weather_cubit/weather_state.dart';
import 'package:wather_app/models/weather_model.dart';
import 'package:wather_app/moduls/search_page.dart';
import 'package:wather_app/providers/weather_provider.dart';



class HomePage extends StatelessWidget{

  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wather app'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(updateUi:(){},),));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit,WeatherState>(
        builder: (context, state) {
          if(state is LoadingWeather){
            return const Center(child: CircularProgressIndicator());
          }else if (state is SuccessWeather){
            weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherModel!.getThemeColor(),
                    weatherModel!.getThemeColor()[500]!,
                    weatherModel!.getThemeColor()[300]!,
                    Colors.white
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              //color: weatherModel!.getThemeColor(),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 3,),
                  Text(BlocProvider.of<WeatherCubit>(context).cityName!,style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,),),
                  Text(weatherModel!.date.day.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,),),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(weatherModel!.getImage()),
                      Text(weatherModel!.temp.toString(),style: TextStyle(fontSize: 24,),),
                      Column(
                        children: [
                          Text('maxTemp :${weatherModel!.maxTemp}'),
                          Text('minTemp :${weatherModel!.minTemp}'),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(weatherModel!.weatherStateName,style: TextStyle(fontSize: 28,),),
                  Spacer(flex: 5,)
                ],
              ),
            );
          }else if (state is ErrorWeather){
            return const Center(child: Text('something went wrong'),);
          }else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'no weather yet',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Search for it',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
