import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _weatherService = WeatherService(apiKey: '018f159c13a6718f9a6b6a043bb8cc79');
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    // get Weather for city
    String cityName = await _weatherService.getCurrentCity();
    // get weather city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    catch(e){
      print(e);
    }
  }

  // init state
  @override
  void initState() {
    super.initState();
    // fetch weather on startup
    _fetchWeather();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // center the content
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // city name
          Text(_weather?.cityName ?? 'Loading...',),
          // Temperature
          Text('${_weather?.temperature.round() ?? 0}°C'),
        ]),
      ),
    );
  }
}