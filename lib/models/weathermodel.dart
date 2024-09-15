class Weathermodel {
  final double temp, mintemp, maxtemp;
  final String description;
  final String icon;
  final DateTime dt_txt;

  Weathermodel(
      {required this.temp,
      required this.mintemp,
      required this.maxtemp,
      required this.description,
      required this.icon,
      required this.dt_txt});
  factory Weathermodel.fromjson(Map<String, dynamic> json) {
    return Weathermodel(
        temp: json["main"]["temp"],
        mintemp: json["main"]["temp_min"],
        maxtemp: json["main"]["temp_max"],
        description: json["weather"][0]["description"],
        icon: json["weather"][0]["icon"],
        dt_txt: DateTime.parse(json["dt_txt"]));
  }
}
