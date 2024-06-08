import 'package:flutter/material.dart';
import 'package:p12_restfull_api/weahter_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: const Center(
          child: WeatherView(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
