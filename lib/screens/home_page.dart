import 'package:flutter/material.dart';
import '../widgets/foot_nav.dart';

// Home
import 'home/widgets/home_header.dart';
import 'home/widgets/summary_section.dart';
import 'home/widgets/quick_start_section.dart';
import 'home/widgets/community_challenge_card.dart';

// Stats
import 'stats/widgets/stats_header.dart';
import 'stats/widgets/weekly_monthly_button.dart';
import 'stats/widgets/calories_times_section.dart';
import 'stats/widgets/calories_chart.dart';

class HomePage extends StatefulWidget {
  final String nama;

  const HomePage({super.key, required this.nama});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool isWeekly = true;

  void _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    if (_selectedIndex == 0) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Column(
            children: [
              HomeHeader(nama: widget.nama),
              const SizedBox(height: 20),
              const SummaryCard(),
              const SizedBox(height: 20),
              QuickStartSection(),
              const SizedBox(height: 20),
              const CommunityChallengeCard(),
              const SizedBox(height: 20),
            ],
          ),

        ),
      );
    } else if (_selectedIndex == 1) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              StatsHeader(),
              const SizedBox(height: 20),
              WeeklyMonthlyButton(
                isWeekly: isWeekly,
                onChanged: (value) {
                  setState(() {
                    isWeekly = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              CaloriesTimesSection(isWeekly: isWeekly),
              const SizedBox(height: 20),
              CaloriesChart(),
            ],
          ),
        ),
      );
    } else if (_selectedIndex == 2) {
      return const Center(child: Text("Profile"));
    } else {
      return const Center(child: Text("Settings"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(child: _buildBody()),

      bottomNavigationBar: FootNav(
        currentIndex: _selectedIndex,
        onTap: _changeTab,
      ),
    );
  }
}
