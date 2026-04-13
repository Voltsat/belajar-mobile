import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CaloriesChart extends StatelessWidget {
  const CaloriesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(38, 38, 38, 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Calories Burned',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D2433),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F9E9), // Warna background hijau muda
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '+12% vs last week',
                  style: TextStyle(
                    color: Color(0xFF1FC157), // Warna teks hijau
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Chart Section
          AspectRatio(
            aspectRatio: 1.70,
            child: LineChart(
              mainData(),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData mainData() {
    List<Color> gradientColors = [
      const Color.fromRGBO(76, 175, 80, 0.3),
      const Color.fromRGBO(76, 175, 80, 0.0),
    ];

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Color.fromRGBO(85, 85, 85, 0.1),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Sembunyikan angka di kiri
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false, // Hilangkan border kotak bawaan
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          // Titik koordinat (X, Y)
          spots: const [
            FlSpot(0, 2),   // Mon
            FlSpot(1, 3.5), // Tue
            FlSpot(2, 3),   // Wed
            FlSpot(3, 4.5), // Thu
            FlSpot(4, 5),   // Fri (Puncak)
            FlSpot(5, 0), // Sat
            FlSpot(6, 0),   // Sun
          ],
          isCurved: true,
          color: const Color(0xFF1FC157),
          barWidth: 3,
          isStrokeCapRound: true,
          // Mengatur titik (dot) pada grafik
          dotData: FlDotData(
            show: true,
            checkToShowDot: (spot, barData) {
              // Hanya tampilkan dot di hari Jumat (index 4)
              return spot.x == 4;
            },
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 6,
                color: const Color(0xFF1FC157),
                strokeWidth: 3,
                strokeColor: const Color(0xFFE5F9E9),
              );
            },
          ),
          // Mengatur area di bawah garis
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    // 1. Definisikan style
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    const selectedStyle = TextStyle(
      color: Color(0xFF1FC157),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    // 2. Tentukan isi teks berdasarkan value (X axis)
    String textContent; // Pakai nama variabel yang berbeda agar jelas
    switch (value.toInt()) {
      case 0: textContent = 'MON'; break;
      case 1: textContent = 'TUE'; break;
      case 2: textContent = 'WED'; break;
      case 3: textContent = 'THU'; break;
      case 4: textContent = 'FRI'; break;
      case 5: textContent = 'SAT'; break;
      case 6: textContent = 'SUN'; break;
      default: textContent = ''; break;
    }

    // 3. Kembalikan SideTitleWidget dengan Text sebagai child
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      fitInside: SideTitleFitInsideData.fromTitleMeta(
        meta,
        enabled: true,
        distanceFromEdge: 0,
      ),
      child: Text(
        textContent, // Ini harus String murni
        style: value.toInt() == 4 ? selectedStyle : style, // Logika style di sini
      ),
    );
  }
}