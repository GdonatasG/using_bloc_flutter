import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/weather_event.dart';
import 'package:flutterbloc/bloc/weather_state.dart';
import 'package:flutterbloc/data/repository/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository);

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    yield WeatherLoading();
    if (event is GetWeather) {
      try {
        final weather = await weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield WeatherError("Can`t fetch weather!");
      }
    } else if (event is GetDetailWeather) {
      try {
        final weather =
            await weatherRepository.fetchDetailedWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield WeatherError("Can`t fetch weather!");
      }
    }
  }
}
