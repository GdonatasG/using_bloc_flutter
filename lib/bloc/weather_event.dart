import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeather extends WeatherEvent {
  final String cityName;

  const GetWeather(this.cityName);

  @override
  List<Object> get props => [cityName];
}

class GetDetailWeather extends WeatherEvent {
  final String cityName;

  const GetDetailWeather(this.cityName);

  @override
  List<Object> get props => [cityName];
}
