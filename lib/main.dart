import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/cubit/weathercubit.dart/weather_cubit.dart';
import 'package:wheather/models/api/apiservice.dart';
import 'package:wheather/ui/searchpage.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherCubit(WeatherService()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Searchpage());
  }
}
