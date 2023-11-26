import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  final String cityName;

  const WeatherPage({Key? key, required this.cityName}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key

  final _weatherService =
      WeatherService(apiKey: dotenv.env['API_KEY'].toString());
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {

    var cityName = widget.cityName;

    try {
      if (cityName == '') {
        cityName = await _weatherService.getCurrentCity();
      }
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
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

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rainy.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
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
              Text(
                _weather?.cityName ?? 'Loading...',
              ),
              // animation
              Lottie.asset(
                getWeatherAnimation(_weather?.mainCondition),
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),

              // Temperature
              Text('${_weather?.temperature.round() ?? 0}°C'),

              // weather condition
              Text(_weather?.mainCondition ?? 'Loading...'),
            ]),
      ),
    );
  }
}
