import 'dart:convert';
import 'dart:io';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    print("latitide: ${location.latitude} longitude: ${location.longitude}");
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=saharsa&appid=8008bcf0e10d9ad68ab28560b9dc6b49&units=metric"));

    final data = jsonDecode(response.body);

    final String city = data["name"];
    final double temp = data["main"]["temp"];
    final int condition = data["weather"][0]["id"];

    print(city);
    print(temp);
    print(condition);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      body: Center(
        child: Text('The contents of this Scaffold was removed.'),
      ),
    );
  }
}
