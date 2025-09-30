import 'package:flutter/material.dart';
import 'package:flutter_start_kit/common/app_colors.dart';

class TopStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final bool loading;
  final String? error;

  const TopStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.loading = false,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: primaryColor.withValues(alpha: 0.15),
              child: Icon(icon, color: primaryColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: t.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 6),
                  if (loading)
                    const SizedBox(
                      height: 16,
                      child: LinearProgressIndicator(minHeight: 6),
                    )
                  else if (error != null)
                    Text(
                      error!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: t.textTheme.bodyMedium?.copyWith(
                        color: t.colorScheme.error,
                      ),
                    )
                  else
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value,
                        style: t.textTheme.titleMedium?.copyWith(
                          color: primaryColor,
                          fontWeight: FontWeight.w800,
                          letterSpacing: .2,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
