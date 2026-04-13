import 'package:flutter/material.dart';
import 'calories_time_card.dart';

class CaloriesTimesSection extends StatefulWidget {
  final bool isWeekly;

  const CaloriesTimesSection({super.key, required this.isWeekly});

  @override
  State<CaloriesTimesSection> createState() => _CaloriesTimesSectionState();
}

class _CaloriesTimesSectionState extends State<CaloriesTimesSection> {
  @override
  Widget build(BuildContext context) {
    String calories = widget.isWeekly ? "12,480" : "64,240";
    String duration = widget.isWeekly ? "8.4h" : "35.2h";

    return Row(
      children: [
        Expanded(
          child: CaloriesTimeCard(
            icon: Icons.local_fire_department,
            iconColor: Colors.green,
            value: calories,
            label: "Total Calories",
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: CaloriesTimeCard(
            icon: Icons.timer,
            iconColor: Colors.blue,
            value: duration,
            label: "Total Duration",
          ),
        ),
      ],
    );
  }
}
