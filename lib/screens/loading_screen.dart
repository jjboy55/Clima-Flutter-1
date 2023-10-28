import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    WeatherModel weatherModel = WeatherModel();

    var weatherData = await weatherModel.getWeatherLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(weatherLocation: weatherData,)));
  }

@override
  void initState() {
    super.initState();
    getLocation();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: SpinKitThreeBounce(color: Colors.white,size:50),),
    );
  }
}
