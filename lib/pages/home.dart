import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_app/pages/cities.dart';
import 'package:weather_app/pages/weather_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentPageIndex = 0;
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [
          WeatherPage(
            cityName: cityName,
          ),
          Cities(),
        ][currentPageIndex],
        bottomNavigationBar: Container(
          color: Colors.blueGrey.shade800,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: GNav(
              backgroundColor: Colors.blueGrey.shade800,
              tabBackgroundColor: Colors.blueGrey.shade700,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              gap: 8,
              padding: const EdgeInsets.all(16),
              onTabChange: (int index) =>
                  setState(() => currentPageIndex = index),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.location_city_rounded,
                  text: 'Cities',
                ),
              ],
            ),
          ),
        ));
  }
}
