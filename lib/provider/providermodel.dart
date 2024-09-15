import 'package:flutter/foundation.dart';
import 'package:wheather/models/api/apiservice.dart';
import 'package:wheather/models/weathermodel.dart';

class Providermodel with ChangeNotifier {
  String? cityName;
  final WeatherService service = WeatherService();
  List<Weathermodel> fiveDayWeather = [];
  List<Weathermodel> hourlyData = [];
  String? errormassege;
  Map<String, dynamic>? Data;

  Future<void> fetchWeather(String cityName) async {
    final response = await service.getFiveDayWeather(cityName);
    if (response.containsKey('error')) {
      errormassege = response['error'];
      Data = null;
      fiveDayWeather.clear();
    } else {
      List<dynamic> weatherList = response['list'];
      final List<dynamic> hourlyWeatherData = weatherList.take(5).toList();
      Data = response;

      errormassege = null;
      fiveDayWeather = weatherList
          .where((item) {
            final hour = DateTime.parse(item['dt_txt']).hour;
            return hour == 15;
          })
          .map((json) => Weathermodel.fromjson(json))
          .toList();
      hourlyData =
          hourlyWeatherData.map((json) => Weathermodel.fromjson(json)).toList();
    }
    notifyListeners();
  }
}
