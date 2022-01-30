import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=fbae47eddedf5b88da19a087cf0d2278');
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  // var id = decodedData['weather'][0]['id'];
  // var tempeture = decodedData['main']['temp'];
  // var city = decodedData['name'];
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
