// lib/presentation/pages/dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_start_kit/presentation/pages/widgets/chart_card.dart';
import 'package:flutter_start_kit/presentation/pages/widgets/cities_list.dart';
import 'package:flutter_start_kit/presentation/pages/widgets/top_stat_card.dart';
import 'package:intl/intl.dart';

import '../../common/app_colors.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _cityCtrl = TextEditingController(text: 'Riyadh');
  final _cities = const ['Riyadh', 'London', 'Tokyo', 'New York', 'Singapore'];

  @override
  void initState() {
    super.initState();
    _fetchAll(_cityCtrl.text);
  }

  @override
  void dispose() {
    _cityCtrl.dispose();
    super.dispose();
  }

  void _fetchAll(String city) {
    final b = context.read<DashboardBloc>();
    b
      ..add(DashboardRequested(city))
      ..add(FiveDayHighsRequested(city))
      ..add(FiveDayRainRequested(city))
      ..add(ConditionShareRequested(city));
  }

  void _onApply() {
    setState(() {}); // refresh CitiesList highlight
    _fetchAll(_cityCtrl.text.trim());
  }

  double _avg(List<double> values) =>
      values.isEmpty ? 0.0 : values.reduce((a, b) => a + b) / values.length;

  int _maxIndex(List<double> values) {
    if (values.isEmpty) return -1;
    double maxVal = values.first;
    int maxIdx = 0;
    for (int i = 1; i < values.length; i++) {
      if (values[i] > maxVal) {
        maxVal = values[i];
        maxIdx = i;
      }
    }
    return maxIdx;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Weather Dashboard'),
        actions: [
          IconButton(
            onPressed: () => _fetchAll(_cityCtrl.text.trim()),
            icon: const Icon(Icons.refresh_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // Search row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cityCtrl,
                    onSubmitted: (_) => _onApply(),
                    decoration: const InputDecoration(
                      hintText: 'Search city…',
                      prefixIcon: Icon(Icons.search_rounded),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton(onPressed: _onApply, child: const Text('Apply')),
              ],
            ),

            const SizedBox(height: 12),

            // Cities list (chips)
            CitiesList(
              cities: _cities,
              selected: _cityCtrl.text,
              onPick: (c) {
                setState(() {
                  _cityCtrl.text = c; // update highlight immediately
                });
                _fetchAll(c);
              },
            ),

            const SizedBox(height: 16),

            // ===== TOP 4 STATS =====
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                // Current Temperature
                SizedBox(
                  width: 300,
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                    buildWhen: (prev, next) =>
                        next is DashboardLoading || next is DashboardLoaded,
                    builder: (context, s) {
                      if (s is DashboardLoading) {
                        return const TopStatCard(
                          title: 'Current Temperature',
                          value: '',
                          icon: Icons.thermostat,
                          loading: true,
                        );
                      } else if (s is DashboardLoaded) {
                        return TopStatCard(
                          title: 'Current Temperature',
                          value: '${s.weather.temperatureC.toStringAsFixed(1)} °C',
                          icon: Icons.thermostat,
                        );
                      }
                      return const TopStatCard(
                        title: 'Current Temperature',
                        value: '—',
                        icon: Icons.thermostat,
                      );
                    },
                  ),
                ),

                // Avg Rain (5d)
                SizedBox(
                  width: 300,
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                    buildWhen: (prev, next) =>
                        next is FiveDayRainLoading || next is FiveDayRainLoaded,
                    builder: (context, s) {
                      if (s is FiveDayRainLoading) {
                        return const TopStatCard(
                          title: 'Avg Rain (5d)',
                          value: '',
                          icon: Icons.water_drop,
                          loading: true,
                        );
                      } else if (s is FiveDayRainLoaded) {
                        final avg = _avg(s.data.rainMm);
                        return TopStatCard(
                          title: 'Avg Rain (5d)',
                          value: '${avg.toStringAsFixed(1)} mm',
                          icon: Icons.water_drop,
                        );
                      }
                      return const TopStatCard(
                        title: 'Avg Rain (5d)',
                        value: '—',
                        icon: Icons.water_drop,
                      );
                    },
                  ),
                ),

                // Avg High Temp (5d)
                SizedBox(
                  width: 300,
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                    buildWhen: (prev, next) =>
                        next is FiveDayHighsLoading || next is FiveDayHighsLoaded,
                    builder: (context, s) {
                      if (s is FiveDayHighsLoading) {
                        return const TopStatCard(
                          title: 'Avg High Temp (5d)',
                          value: '',
                          icon: Icons.timeline,
                          loading: true,
                        );
                      } else if (s is FiveDayHighsLoaded) {
                        final avg = _avg(s.data.highsC);
                        return TopStatCard(
                          title: 'Avg High Temp (5d)',
                          value: '${avg.toStringAsFixed(1)} °C',
                          icon: Icons.timeline,
                        );
                      }
                      return const TopStatCard(
                        title: 'Avg High Temp (5d)',
                        value: '—',
                        icon: Icons.timeline,
                      );
                    },
                  ),
                ),

                // Condition (dominant label)
                SizedBox(
                  width: 300,
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                    buildWhen: (prev, next) =>
                        next is ConditionShareLoading || next is ConditionShareLoaded,
                    builder: (context, s) {
                      if (s is ConditionShareLoading) {
                        return const TopStatCard(
                          title: 'Condition',
                          value: '',
                          icon: Icons.cloud,
                          loading: true,
                        );
                      } else if (s is ConditionShareLoaded) {
                        final i = _maxIndex(s.data.values);
                        final label = i >= 0 ? s.data.labels[i] : '—';
                        return TopStatCard(
                          title: 'Condition',
                          value: label,
                          icon: Icons.cloud,
                        );
                      }
                      return const TopStatCard(
                        title: 'Condition',
                        value: '—',
                        icon: Icons.cloud,
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ===== BIG LINE CHART (Highs) =====
            BlocBuilder<DashboardBloc, DashboardState>(
              buildWhen: (p, n) =>
                  n is FiveDayHighsLoading || n is FiveDayHighsLoaded,
              builder: (context, state) {
                if (state is FiveDayHighsLoading) {
                  return const ChartCard.skeleton(title: 'Daily Max Temperatures Forecast');
                }
                if (state is FiveDayHighsLoaded) {
                  final days = state.data.days;
                  final values = state.data.highsC;
                  final spots = [
                    for (var i = 0; i < days.length; i++)
                      FlSpot(i.toDouble(), values[i]),
                  ];
                  return ChartCard(
                    title: 'Daily Max Temperatures Forecast',
                    child: SizedBox(
                      height: 350,
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              spots: spots,
                              isCurved: true,
                              barWidth: 3,
                              color: primaryColor,
                              dotData: const FlDotData(show: true),
                            ),
                          ],
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (v, _) {
                                  final i = v.toInt();
                                  if (i < 0 || i >= days.length) return const SizedBox();
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      DateFormat('E').format(days[i]),
                                      style: const TextStyle(color: textSubtle),
                                    ),
                                  );
                                },
                              ),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                            ),
                          ),
                          gridData: FlGridData(
                            show: true,
                            getDrawingHorizontalLine: (_) =>
                                const FlLine(color: divider, strokeWidth: 1),
                            getDrawingVerticalLine: (_) =>
                                const FlLine(color: divider, strokeWidth: 1),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: const Border(
                              top: BorderSide(color: divider),
                              left: BorderSide(color: divider),
                              right: BorderSide(color: divider),
                              bottom: BorderSide(color: divider),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return const ChartCard.error(
                  title: 'Daily Highs (Next 5 Days)',
                  message: 'Could not load highs',
                );
              },
            ),

            const SizedBox(height: 16),

            // PIE + BAR CHARTS 
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                // Pie: Condition distribution
                SizedBox(
                  width: 350,
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                    buildWhen: (p, n) =>
                        n is ConditionShareLoading || n is ConditionShareLoaded,
                    builder: (context, s) {
                      if (s is ConditionShareLoading) {
                        return const ChartCard.skeleton(title: 'Condition Distribution');
                      }
                      if (s is ConditionShareLoaded) {
                        final labels = s.data.labels;
                        final values = s.data.values;
                        final total = values.fold<double>(0, (a, b) => a + b);
                        final sections = [
                          for (var i = 0; i < labels.length; i++)
                            PieChartSectionData(
                              value: values[i],
                              title: total > 0
                                  ? "${((values[i] / total) * 100).toStringAsFixed(0)}%"
                                  : "",
                              radius: 56,
                              color: _pieColor(i),
                              titleStyle: const TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                        ];
                        return ChartCard(
                          title: 'Condition Distribution',
                          child: Column(
                            children: [
                              SizedBox(
                                height: 240,
                                child: PieChart(
                                  PieChartData(
                                    sections: sections,
                                    sectionsSpace: 2,
                                    centerSpaceRadius: 32,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 10,
                                runSpacing: 8,
                                children: [
                                  for (var i = 0; i < labels.length; i++)
                                    _LegendDot(label: labels[i], color: _pieColor(i)),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                      return const ChartCard.error(
                        title: 'Condition Distribution',
                        message: 'Could not load conditions',
                      );
                    },
                  ),
                ),

                // Bar: Rain mm
                SizedBox(
                  width: 650,
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                    buildWhen: (p, n) =>
                        n is FiveDayRainLoading || n is FiveDayRainLoaded,
                    builder: (context, s) {
                      if (s is FiveDayRainLoading) {
                        return const ChartCard.skeleton(title: 'Rain (mm) • Next 5 Days');
                      }
                      if (s is FiveDayRainLoaded) {
                        final days = s.data.days;
                        final values = s.data.rainMm;
                        final groups = [
                          for (var i = 0; i < days.length; i++)
                            BarChartGroupData(x: i, barRods: [
                              BarChartRodData(
                                toY: values[i],
                                width: 18,
                                borderRadius: BorderRadius.circular(6),
                                color: primaryColor,
                              ),
                            ])
                        ];
                        return ChartCard(
                          title: 'Rain (mm) • Next 5 Days',
                          child: SizedBox(
                            height: 260,
                            child: BarChart(
                              BarChartData(
                                barGroups: groups,
                                titlesData: FlTitlesData(
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: (v, _) {
                                        final i = v.toInt();
                                        if (i < 0 || i >= days.length) {
                                          return const SizedBox();
                                        }
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: Text(
                                            DateFormat('E').format(days[i]),
                                            style: const TextStyle(color: textSubtle),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  leftTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                                  ),
                                ),
                                gridData: FlGridData(
                                  show: true,
                                  getDrawingHorizontalLine: (_) =>
                                      const FlLine(color: divider, strokeWidth: 1),
                                  getDrawingVerticalLine: (_) =>
                                      const FlLine(color: divider, strokeWidth: 1),
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                  border: const Border(
                                    top: BorderSide(color: divider),
                                    left: BorderSide(color: divider),
                                    right: BorderSide(color: divider),
                                    bottom: BorderSide(color: divider),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return const ChartCard.error(
                        title: 'Rain (mm) • Next 5 Days',
                        message: 'Could not load rain',
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// helpers
class _LegendDot extends StatelessWidget {
  final String label;
  final Color color;
  const _LegendDot({required this.label, required this.color});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      const SizedBox(width: 6),
      Text(label, style: const TextStyle(color: textSubtle)),
    ]);
  }
}

Color _pieColor(int i) => [
  primaryColor,
  selectionColor,
  const Color(0xFFFFC857),
  const Color(0xFFEF476F),
][i % 4];
