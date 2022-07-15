class Weather {
  int? id;
  String? mainW, description, icon;

  Weather({
    required this.id,
    required this.mainW,
    required this.description,
    required this.icon,
  });
  Weather.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    mainW=json['main'].toString();
    description=json['description'];
    icon=json['icon'];
  }
  Map<String,dynamic> toJson(){
    return 
    {
      'id' : id,
      'main' : mainW,
      'description' : description,
      'icon' : icon,
    };
  }
}
