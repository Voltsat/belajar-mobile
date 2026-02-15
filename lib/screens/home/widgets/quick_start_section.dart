import 'package:belajar_flutter/screens/home/widgets/quick_start_card.dart';
import 'package:flutter/material.dart';

class QuickStartSection extends StatelessWidget {
  const QuickStartSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "title": "Running",
        "subtitle": "2.4 km total today",
        "icon": Icons.directions_run,
        "iconColor": Colors.green,
        "bgColor": Colors.green.shade50,
      },
      {
        "title": "Cycling",
        "subtitle": "Ready to ride?",
        "icon": Icons.directions_bike,
        "iconColor": Colors.blue,
        "bgColor": Colors.blue.shade50,
      },
      {
        "title": "Gym",
        "subtitle": "Next: Destroy Shoulder",
        "icon": Icons.fitness_center,
        "iconColor": Colors.orange,
        "bgColor": Colors.orange.shade50,
      },
      {
        "title": "Basketball",
        "subtitle": "Match at 6 PM",
        "icon": Icons.sports_basketball,
        "iconColor": Colors.purple,
        "bgColor": Colors.purple.shade50,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Quick Start",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              InkWell(
                onTap: () {
                  debugPrint("See All Dipencet");
                },
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              final item = items[index];

              return QuickStartCard(
                title: item["title"] as String,
                subtitle: item["subtitle"] as String,
                icon: item["icon"] as IconData,
                iconColor: item["iconColor"] as Color,
                bgColor: item["bgColor"] as Color,
              );
            },
          ),
        ],
      ),
    );
  }
}
