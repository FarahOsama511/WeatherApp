import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/cubit/weathercubit.dart/weather_state.dart';
import 'package:wheather/models/api/apiservice.dart';
import 'package:wheather/models/weathermodel.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(weatherIntial());
  WeatherService weatherService;
  String? cityName;
  String? errormassege;

  void getweather(String cityName) async {
    emit(weatherLoading());
    try {
      final response = await weatherService.getFiveDayWeather(cityName);
      print(response);
      if (response.containsKey('error')) {
        emit(weatherFailure(response['error']));
      } else {
        List<dynamic> weatherList = response['list'];
        final List<dynamic> hourlyWeatherData = weatherList.take(5).toList();
        List<Weathermodel> fiveDayWeather = weatherList
            .where((item) {
              final hour = DateTime.parse(item['dt_txt']).hour;
              return hour == 15;
            })
            .map((json) => Weathermodel.fromjson(json))
            .toList();
        List<Weathermodel> hourlyData = hourlyWeatherData
            .map((json) => Weathermodel.fromjson(json))
            .toList();
        emit(weatherSuccess(
            fiveDayWeather: fiveDayWeather, hourlyData: hourlyData));
      }
    } catch (e) {
      emit(weatherFailure(e.toString()));
    }
  }
}
