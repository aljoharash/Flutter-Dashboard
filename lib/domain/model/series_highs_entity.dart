/// The `FiveDayHighsEntity` class represents the high temperatures for a city over five days.
class FiveDayHighsEntity {
  final String city;
  final List<DateTime> days; 
  final List<double> highsC; 
  const FiveDayHighsEntity({required this.city, required this.days, required this.highsC});
}
