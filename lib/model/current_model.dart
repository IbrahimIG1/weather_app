

import 'package:weather/model/clouds.dart';
import 'package:weather/model/coord.dart';
import 'package:weather/model/main_weater_data.dart';
import 'package:weather/model/sys.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/model/wind.dart';

class Current {
  Coord? coord;
  List<Weather>? weather;
  MainWeather? mainW;
  String? base;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  Sys? sys;
  int? timezone;
  String? name;
  Current.fromJson(Map<String, dynamic> json) {
    coord = Coord.fromjson(json['coord']);
    weather =
        (json['weather'] as List).map((w) => Weather.fromJson(w)).toList();
    base = json['base'];
    mainW = MainWeather.fromJson(json['main']);
    visibility = json['visibility'];
    wind = Wind.fromJson(json['wind']);
    clouds = Clouds.fromJson(json['clouds']);
    sys = Sys.fromJson(json['sys']);
    timezone = json['timezone'];
    name = json['name'];
  }
}
