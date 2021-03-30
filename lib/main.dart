// Bloc pattern for State Management
import 'package:flutter/material.dart';
import 'package:weatherusing_bloc/BLOC/weatherBLOC.dart';
import 'package:weatherusing_bloc/Repository/weatherRepo.dart';
import 'Screens/homeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App using BLOC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        body: BlocProvider<WeatherBloc>(
            create: ((context) => WeatherBloc(weatherRepo: WeatherRepo())),
            child: SearchPage()),
      ),
    );
  }
}
