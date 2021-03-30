import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherusing_bloc/Model/weatherModel.dart';
import 'package:weatherusing_bloc/Repository/weatherRepo.dart';

// extending to Equatable because we will be comparing the objects of this class
class WeatherEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// 2 different types of events
class FetchWeather extends WeatherEvent {
  // city name will be recieved by this event
  final _city;
  FetchWeather(this._city);

  @override
  // TODO: implement props
  List<Object> get props => [_city];
}

class ResetWeather extends WeatherEvent {}

class WeatherState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// 4 different types of States
class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather;

  @override
  // TODO: implement props
  List<Object> get props => [_weather];
}

class WeatherIsNotLoaded extends WeatherState {
  // In case of Error
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;

  WeatherBloc({@required this.weatherRepo})
      : assert(weatherRepo != null),
        super(WeatherIsNotSearched());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchWeather) {
      yield WeatherIsLoading(); // new state

      try {
        WeatherModel weather = await weatherRepo.getWeather(event._city);
        yield WeatherIsLoaded(weather);
        // yield is same as return but it does not terminate the Function.
      } catch (_) {
        print(_);
        WeatherIsNotLoaded();
      }
    } else if (event is ResetWeather) {
      yield WeatherIsNotSearched();
    }
  }
}
