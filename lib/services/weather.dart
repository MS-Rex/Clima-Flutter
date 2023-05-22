import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import '../apiKeys/apis.dart';

Future<dynamic> getgetLocation() async {
  Location locationn = Location();
  await locationn.getLocation();
  NetworkHelper networkhelp = NetworkHelper(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=${locationn.latitude}&lon=${locationn.longitude}&appid=$apikey&units=metric'));
  var weatherdetail = await networkhelp.getData();
  return weatherdetail;
}

class WeatherModel {
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
      return '☁️ ';
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

Future<dynamic> getCityLocation(String cityName) async {
  NetworkHelper networkhelp = NetworkHelper(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric'));
  var weatherdetail = await networkhelp.getData();
  //print(weatherdetail);
  return weatherdetail;
}
