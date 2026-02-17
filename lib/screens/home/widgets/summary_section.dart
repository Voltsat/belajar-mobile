import 'package:flutter/material.dart';
import 'summary_box.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Daily Summary",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: -6.3,
                      child: Transform.scale(
                        scaleX: -1,
                        child: SizedBox(
                          width: 140,
                          height: 140,
                          child: CircularProgressIndicator(
                            value: 0.84,
                            strokeWidth: 10,
                            strokeCap: StrokeCap.round,
                            color: Colors.greenAccent,
                            backgroundColor: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ),

                    Transform.rotate(
                      angle: -6.4,
                      child: Transform.scale(
                        scaleX: -1,
                        child: SizedBox(
                          width: 105,
                          height: 105,
                          child: CircularProgressIndicator(
                            value: 0.67,
                            strokeWidth: 10,
                            strokeCap: StrokeCap.round,
                            color: Colors.blueAccent,
                            backgroundColor: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ),

                    Transform.rotate(
                      angle: -6.3,
                      child: Transform.scale(
                        scaleX: -1,
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: CircularProgressIndicator(
                            value: 0.77,
                            strokeWidth: 10,
                            strokeCap: StrokeCap.round,
                            color: Colors.orange,
                            backgroundColor: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ),

                    const Icon(Icons.flash_on, size: 30, color: Colors.grey),
                  ],
                ),

                const SizedBox(width: 20),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SummaryBox(
                        color: Colors.green,
                        title: "Steps",
                        value: "8,432",
                        unit: "/10k",
                      ),
                      SummaryBox(
                        color: Colors.blue,
                        title: "Calories",
                        value: "450",
                        unit: "kcal",
                      ),
                      SummaryBox(
                        color: Colors.orange,
                        title: "Time",
                        value: "45",
                        unit: "min",
                      ),
                    ],
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
