import 'package:dio/dio.dart';

class DioHelper {
  String? city;

  String baseUrl = 'https://api.openweathermap.org/data/2.5/';
  // String apiKey = '846381df4263bf9e37bfbd93565a764b';
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://api.openweathermap.org/data/2.5/',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getCurrentWeather(String url) async{
    return await dio!.get(url);
  }
}
