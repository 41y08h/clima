import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const kApiKey = "8008bcf0e10d9ad68ab28560b9dc6b49";
const kApiUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future getCityWeather(String cityName) async {
    final url = '$kApiUrl?q=$cityName&appid=$kApiKey&units=metric';
    final weatherData = await NetworkHelper(url).getData();

    return weatherData;
  }

  Future getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    final data = await NetworkHelper(
            '$kApiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric')
        .getData();

    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
