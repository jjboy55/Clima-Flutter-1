import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final weatherLocation;
  LocationScreen({this.weatherLocation});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  double temp = 0;
  int temperature = 0;
  String weatherIcon = '';
  String temperatureMessage = '';
  String? cityName;
  void initState() {
    super.initState();
    uiElements(widget.weatherLocation);
  }

// z function that re
  void uiElements(dynamic weather) {
    setState(() {
      temp = weather['main']['temp'];
      temperature = temp.toInt();
      temperatureMessage = weatherModel.getMessage(temperature);
      var condition = weather['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      cityName = weather['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      await weatherModel.getWeatherLocation();
                      uiElements(weatherModel.getWeatherLocation());
                    },
                    child: Container(
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      if(typedName != null ){
                       var weatherWithCityName =  await weatherModel.getWeatherData(typedName);
                        uiElements(weatherWithCityName);
                      }
                    },
                    child: Container(
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$temperatureMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
