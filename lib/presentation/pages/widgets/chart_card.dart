import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  final String title;
  final Widget child;
  final String? errorMessage;

  const ChartCard({
    super.key,
    required this.title,
    required this.child,
    this.errorMessage,
  });

  const ChartCard.skeleton({super.key, required this.title})
      : child = const SizedBox(
          height: 240,
          child: Center(child: CircularProgressIndicator()),
        ),
        errorMessage = null;

  const ChartCard.error({super.key, required this.title, required String message})
      : child = const SizedBox(height: 240),
        errorMessage = message;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);

    final content = errorMessage == null
        ? child
        : SizedBox(
            height: 280,
            child: Center(
              child: Text(
                errorMessage!,
                style: t.textTheme.bodyMedium?.copyWith(color: t.colorScheme.error),
              ),
            ),
          );

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: t.textTheme.titleMedium),
            const SizedBox(height: 12),
            content,
          ],
        ),
      ),
    );
  }
}
