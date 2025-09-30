import 'package:flutter/material.dart';
import 'package:flutter_start_kit/common/app_colors.dart';

class CitiesList extends StatelessWidget {
  final List<String> cities;
  final String selected;
  final ValueChanged<String> onPick;

  const CitiesList({
    super.key,
    required this.cities,
    required this.selected,
    required this.onPick,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: cities.map((c) {
        final isSel = selected.trim().toLowerCase() == c.toLowerCase();
        return FilterChip(
          label: Text(c),
          selected: isSel,
          onSelected: (_) => onPick(c),
          selectedColor: selectionColor.withValues(alpha: 0.25),
          showCheckmark: false,
        );
      }).toList(),
    );
  }
}
