import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weatherusing_bloc/Model/weatherModel.dart';

// This class will be calling the API
class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.Client().get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=7c527bceebadff9006977cf598974a9f&units=metric'));

    if (result.statusCode != 200) {
      throw Exception();
    }

    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded['main'];

    return WeatherModel.fromJson(jsonWeather);
  }
}
