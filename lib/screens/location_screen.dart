import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final passWeather;
  LocationScreen(this.passWeather);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temprature;
  late int condition;
  String? cityname;
  late double temp2;
  //late String wMessage;
  //String? wWeatherIcon;

  @override
  void initState() {
    super.initState();
    //print(widget.passWeather);
    updateUI(widget.passWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temprature = 0;
        condition = 0;
        return;
      }
      double temp = weatherData['main']['temp'];
      temprature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      cityname = weatherData['name'];
      //wMessage = wm.getMessage(temprature);

      print(cityname);
    });
  }

  WeatherModel wm = WeatherModel();

  //Location loc=Location();

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
                  TextButton(
                    onPressed: () async {
                      var refreshWeather = await getgetLocation();
                      setState(() {
                        temp2 = refreshWeather['main']['temp'];
                        temprature = temp2.toInt();
                        condition = refreshWeather['weather'][0]['id'];
                        cityname = refreshWeather['name'];
                        print(cityname);
                        print("Its clicked yo");
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var passCity = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }),
                      );
                      if (passCity != null) {
                        //print(passCity.toString());
                        var fwweather = await getCityLocation(passCity);
                        updateUI(fwweather);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      temprature.toString(),
                      style: kTempTextStyle,
                    ),
                    Text(
                      wm.getWeatherIcon(condition),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '${wm.getMessage(temprature)} in $cityname',
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
