import 'package:clima/services/networking.dart';
import 'package:clima/utilities/location.dart';
import 'package:flutter/services.dart';

const apiKey = 'bfdf41dcb1497aec26638e957ebdcda6';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation(); // await를 쓸려면 반환형이 Future여야 한다.

    NetworkHelper networkHelper = NetworkHelper('${openWeatherMapURL}lat=${location.latitude}&lon=${location.longitude}&appid=${apiKey}&units=metric');

    var weatherData = await networkHelper.getData();

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
