import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/pages/weather_page.dart';

class Cities extends StatefulWidget {
  const Cities({super.key});

  @override
  State<Cities> createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(.0),
          child: Text(
            '5 Major Cities',
            style: GoogleFonts.oswald(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: ListView(
        children: [
          getBuildCities(cityName: 'Jakarta'),
          getBuildCities(cityName: 'Surabaya'),
          getBuildCities(cityName: 'Medan'),
          getBuildCities(cityName: 'Bandung'),
          getBuildCities(cityName: 'Bekasi'),
        ],
      ),
    );
  }

  Widget getBuildCities({
    required String cityName,
  }) =>
      _buildCities(cityName);

  Widget _buildCities(String cityName) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WeatherPage(
              cityName: cityName,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.location_city_rounded,
              size: 40,
            ),
            Text(cityName,
                style: GoogleFonts.oswald(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                )),
          ],
        ),
      ),
    );
  }
}
