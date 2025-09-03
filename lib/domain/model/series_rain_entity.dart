class FiveDayRainEntity {
  final String city;
  final List<DateTime> days; // x-axis
  final List<double> rainMm; // total rain per day
  const FiveDayRainEntity({required this.city, required this.days, required this.rainMm});
}
