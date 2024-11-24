import 'package:wheather/models/weathermodel.dart';

abstract class WeatherState {}

class weatherIntial extends WeatherState {}

class weatherLoading extends WeatherState {}

class weatherSuccess extends WeatherState {
  List<Weathermodel> fiveDayWeather = [];
  List<Weathermodel> hourlyData = [];
  weatherSuccess({required this.fiveDayWeather, required this.hourlyData});
}

class weatherFailure extends WeatherState {
  String errorMessage;

  weatherFailure(this.errorMessage);
}
