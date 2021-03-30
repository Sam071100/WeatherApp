import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherusing_bloc/BLOC/weatherBLOC.dart';
import 'package:weatherusing_bloc/Model/weatherModel.dart';

class ShowWeather extends StatelessWidget {
  final WeatherModel weather;
  final city;

  ShowWeather(this.weather, this.city);

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Container(
      padding: EdgeInsets.only(right: 32, left: 32, top: 10),
      child: Column(
        children: <Widget>[
          Text(
            city,
            style: TextStyle(
                color: Colors.white70,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${(weather.temp).toString()}°C',
            style: TextStyle(color: Colors.white70, fontSize: 50),
          ),
          Text(
            "Temprature",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '${(weather.tempmin).toString()}°C',
                    style: TextStyle(color: Colors.white70, fontSize: 30),
                  ),
                  Text(
                    "Min Temprature",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '${(weather.tempmax).toString()}°C',
                    style: TextStyle(color: Colors.white70, fontSize: 30),
                  ),
                  Text(
                    "Max Temprature",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {
                weatherBloc.add(ResetWeather());
              },
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              style: TextButton.styleFrom(
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                backgroundColor: Colors.lightBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
