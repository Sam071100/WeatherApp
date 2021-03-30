class WeatherModel {
  final temp;
  final pressure;
  final humidity;
  final tempmax;
  final tempmin;

  WeatherModel(
      {this.temp, this.pressure, this.humidity, this.tempmax, this.tempmin});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        temp: json['temp'],
        pressure: json['pressure'],
        tempmax: json['temp_max'],
        tempmin: json['temp_min']);
  }
}
