part of 'weather_cubit.dart';

sealed class WeatherState {
  const WeatherState();
}

class InitialWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class ResponseWeatherState extends WeatherState {
  ResponseWeatherState({required this.location, required this.temp});
  final String location;
  final String temp;
}
