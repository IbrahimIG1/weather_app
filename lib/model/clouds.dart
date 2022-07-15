class Clouds
{
  int? all;
  Clouds({required this.all});

  Clouds.fromJson(Map<String,dynamic>json)
  {
    all=json['all'];
  }
  Map<String,dynamic>toJson()
  {
    return 
    {
      'all':all
    };
  }
}