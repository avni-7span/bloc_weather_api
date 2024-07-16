import 'package:bloc_weather_api/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController locationController = TextEditingController();

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Api calling with Bloc '),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 30, right: 30),
            //   child: TextField(
            //     controller: locationController,
            //     decoration: InputDecoration(hintText: 'Enter Loaction'),
            //   ),
            // ),
            IconButton(
              onPressed: () async {
                await context.read<WeatherCubit>().getWeatherData();
              },
              icon: const Icon(
                Icons.search,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                switch (state) {
                  case InitialWeatherState():
                    return const Text(
                      'Initial',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  case ResponseWeatherState():
                    return Column(
                      children: [
                        Text(
                          state.location,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          'Degree Celsius : ${state.temp}',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  case LoadingWeatherState():
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
