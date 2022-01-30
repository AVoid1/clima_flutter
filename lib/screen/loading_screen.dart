import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_flutter/services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locatoinWeather: weatherData,
      );
    }));
  }

  // print(id);
  // print(tempeture);
  // print(city);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitSpinningLines(
        color: Colors.white,
        size: 75,
      ),
    );
  }
}
