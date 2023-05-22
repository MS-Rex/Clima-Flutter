import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final weatherurl;
  NetworkHelper(this.weatherurl);
  Future getData() async {
    Response response = await get(weatherurl);
    if (response.statusCode == 200) {
      String weatherdata = response.body;
      var decodeWeather = jsonDecode(weatherdata);
      return decodeWeather;
    } else {
      print(response.statusCode);
    }
  }
}
