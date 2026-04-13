import 'package:flutter/material.dart';

class CaloriesTimeCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const CaloriesTimeCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(height: 16),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      );
  }
}
