import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/cubit/weathercubit.dart/weather_cubit.dart';
import 'package:wheather/cubit/weathercubit.dart/weather_state.dart';
import 'package:wheather/ui/searchpage.dart';
import 'package:wheather/ui/widgets/Successbody.dart';
import 'package:wheather/ui/widgets/errorpage.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(77, 6, 8, 71),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Searchpage()),
                );
              },
            ),
          ],
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, State) {
          if (State is weatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (State is weatherSuccess) {
            return SuccessBody(
              cityName: BlocProvider.of<WeatherCubit>(context).cityName!,
              fivedayweather: State.fiveDayWeather,
              hourlydata: State.hourlyData,
            );
          } else if (State is weatherFailure) {
            return Errorpage(error: State.errorMessage ?? " Error");
          } else {
            return const Center(
              child: Text("No data available"),
            );
          }
        }));
  }
}
