class Coord {
  double? lon, lat;
  Coord({required this.lon, required this.lat});

  Coord.fromjson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }
  Map<String, dynamic> toJson() {
    return {'lon': this.lon, 'lat': this.lat};
  }
}
