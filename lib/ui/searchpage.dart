import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/cubit/weathercubit.dart/weather_cubit.dart';
import 'package:wheather/ui/homescreen.dart';
import 'package:wheather/ui/widgets/textfield.dart';

class Searchpage extends StatefulWidget {
  Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Textfield(
          onchanged: (data) {
            cityName = data;
          },
          onsubmitted: (value) {
            cityName = value;
            BlocProvider.of<WeatherCubit>(context).cityName = cityName!;
            // await weatherdata.fetchWeather(cityName!);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WeatherPage();
            }));
          },
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () {
                  BlocProvider.of<WeatherCubit>(context).cityName = cityName!;
                  // await weatherdata.fetchWeather(cityName!);

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WeatherPage();
                  }));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}
