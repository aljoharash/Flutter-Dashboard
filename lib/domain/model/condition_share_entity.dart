/// The `ConditionShareEntity` class represents data related to a city including its name, labels, and
/// corresponding values.
class ConditionShareEntity {
  final String city;
  final List<String> labels; 
  final List<double> values;
  const ConditionShareEntity({required this.city, required this.labels, required this.values});
}
