import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var weatherweather;
  final myController = TextEditingController();
  String? inputWeather;

  @override
  void initState() {
    super.initState();
    getgetLocation2();
  }

  void getgetLocation2() async {
    var weatherdetail2 = await getgetLocation();
    weatherweather = weatherdetail2;
    if (weatherdetail2 == null) {
      print("Sorry komlo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: kInputDecoration,
                  onChanged: (value) {
                    //print(value);
                    inputWeather = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (inputWeather != null) {
                    //var newcity = await getCityLocation('london');
                    //print(newcity);
                    print(inputWeather);
                    Navigator.pop(context, inputWeather);
                  }
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
