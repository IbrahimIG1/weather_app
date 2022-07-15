

class FiveDaysModel
{
  // List data=[];
  // FiveDaysModel.fromJson(Map<String, dynamic> json)
  // {
  //   data = json['list'];
    
  // }
   String? dateTime;
   int? temp;

  FiveDaysModel({required this.dateTime, required this.temp});
  

  factory FiveDaysModel.fromJson(dynamic json) {
   
    var f = json['dt_txt'].split(' ')[0].split('-')[2];
    var l = json['dt_txt'].split(' ')[1].split(':')[0];
    var fandl = '$f-$l';
    return FiveDaysModel(
      dateTime: fandl,
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }
}