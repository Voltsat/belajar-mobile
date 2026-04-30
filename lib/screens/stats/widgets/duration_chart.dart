import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DurationChart extends StatelessWidget {
  const DurationChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 240,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Workout Duration",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 60,

                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),

                barTouchData: BarTouchData(
                  enabled: false,
                ),

                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,

                      getTitlesWidget: (value, meta) {
                        const days = [
                          'M',
                          'T',
                          'W',
                          'T',
                          'F',
                          'S',
                          'S',
                        ];

                        if (value.toInt() < 0 ||
                            value.toInt() >= days.length) {
                          return const SizedBox();
                        }

                        final isSelected = value.toInt() == 4;

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            days[value.toInt()],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: isSelected
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                barGroups: [
                  makeGroupData(0, 28),
                  makeGroupData(1, 38),
                  makeGroupData(2, 52),
                  makeGroupData(3, 25),
                  makeGroupData(4, 47, isSelected: true),
                  makeGroupData(5, 18),
                  makeGroupData(6, 35),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isSelected = false,
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: y,
          width: 24,
          borderRadius: BorderRadius.circular(8),
          color: isSelected
              ? const Color(0xff3D7EF0)
              : const Color(0xffE3E8F2),
        ),
      ],
    );
  }
}