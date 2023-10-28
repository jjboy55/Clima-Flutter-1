import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {

  Future<dynamic> getWeatherData(String cityName) async {
    Location location = Location();
    NetworkBrain networkBrain = NetworkBrain('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=1b2bf8aeea0f84dbea7959fc45a1235d&units=metric');
    var weatherData = await networkBrain.getWeather();
    return weatherData;
  }
  Future<dynamic> getWeatherLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkBrain networkBrain = NetworkBrain('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=1b2bf8aeea0f84dbea7959fc45a1235d&units=metric');
    var weatherData =  await networkBrain.getWeather();

    return weatherData;
  }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
