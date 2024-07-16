import 'package:bloc_weather_api/repository/api_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitialWeatherState());

  Future<void> getWeatherData(String cityLocation) async {
    try {
      emit(LoadingWeatherState());
      final data = await ApiClient().getModel(cityLocation);
      String? location = data?.location?.name.toString();
      String? temp = data?.current?.tempCelsius.toString();
      emit(ResponseWeatherState(location: location!, temp: temp!));
    } catch (e) {}
  }
}
