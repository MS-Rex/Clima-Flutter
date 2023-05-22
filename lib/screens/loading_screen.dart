import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//const apikey = '4bdc730f0a7a0e2c63ea59fe3499149a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getgetLocation2();
  }

  void getgetLocation2() async {
    var weatherdetail2 = await getgetLocation();
    if (weatherdetail2 == null) {
      print("Sorry komlo");
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen(weatherdetail2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitWanderingCubes(
        color: Colors.white,
        size: 50.0,
      )),
    );
  }
}
