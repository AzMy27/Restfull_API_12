import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'weather.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: _fetchWeather(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Weather? data = snapshot.data;
          return _weatherView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Future<Weather> _fetchWeather() async {
    var uri = Uri.parse('https://mock-json-service.glitch.me/weather');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data from API');
    }
  }

  Widget _weatherView(Weather? data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'City: ${data?.cityName}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text('Weather: ${data?.main} - ${data?.description}'),
        Text('Temperature: ${data?.temp}°K'),
        Text('Feels Like: ${data?.feelsLike}°K'),
        Text('Min Temperature: ${data?.tempMin}°K'),
        Text('Max Temperature: ${data?.tempMax}°K'),
        Text('Pressure: ${data?.pressure} hPa'),
        Text('Humidity: ${data?.humidity}%'),
        Text('Wind Speed: ${data?.windSpeed} m/s'),
      ],
    );
  }
}
