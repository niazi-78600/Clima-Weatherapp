import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'deb09726855713f01a72b83a93819e6d';
const url = "https://api.openweathermap.org/data/2.5/weather?units=metric&";

class WeatherModel {
  Future getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper("${url}q=$cityName&appid=$apiKey");
    print("API GET!");

    var locationWeather = await networkHelper.getData();
    return locationWeather;
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrenLocation();
    print("Latitude: ${location.getLatitude()}");
    print("Longitude: ${location.getLongitude()}");

    NetworkHelper networkHelper = NetworkHelper(
        "${url}lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey");
    print("API GET!");

    var locationWeather = await networkHelper.getData();
    return locationWeather;
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
