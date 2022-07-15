class MainWeather {
  double? temp, feelsLike, tempMin, tempMax;
  int? pressure, humidity;

  MainWeather({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });
  MainWeather.fromJson(Map<String, dynamic> json) {
    temp = double.parse(json['temp'].toString());
    feelsLike = json['feels_like'];
    tempMin = double.parse(json['temp_min'].toString());
    tempMax = double.parse(json['temp_max'].toString());
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
    };
  }
}
