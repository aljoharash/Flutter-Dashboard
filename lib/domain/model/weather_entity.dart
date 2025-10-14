/// The WeatherEntity class represents weather data for a specific city including temperature, humidity,
/// condition, and description.
class WeatherEntity {
  final String city;
  final double temperatureC;
  final int humidity;
  final String condition;
  final String description;

  const WeatherEntity({
    required this.city,
    required this.temperatureC,
    required this.humidity,
    required this.condition,
    required this.description,
  });
}
