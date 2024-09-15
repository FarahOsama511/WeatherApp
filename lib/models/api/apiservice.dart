import 'package:dio/dio.dart';

class WeatherService {
  final Dio _dio = Dio();
  final String apiKey = 'f21256fcc7f8e8e2646534ff38bf20e4';
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/forecast';

  Future<Map<String, dynamic>> getFiveDayWeather(String city) async {
    Response response;
    try {
      response = await _dio.get(
        apiUrl,
        queryParameters: {
          'q': city,
          'appid': apiKey,
          'units': 'metric',
        },
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        return {"error": "This city not found,try again"};
      } else {
        return {"error": "please check your connection"};
      }
    }
  }
}
