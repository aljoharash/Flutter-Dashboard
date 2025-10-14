/// The `FiveDayRainEntity` class represents the rainfall data for a city over a five-day period with
/// information on the city name, dates, and total rainfall in millimeters for each day.
class FiveDayRainEntity {
  final String city;
  final List<DateTime> days; // x-axis
  final List<double> rainMm; // total rain per day
  const FiveDayRainEntity({required this.city, required this.days, required this.rainMm});
}
