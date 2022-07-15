import 'package:flutter/material.dart';
import 'package:weather/Home/home.dart';
import 'package:weather/remote/dio_helper.dart';


void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}