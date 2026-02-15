import 'package:flutter/material.dart';
import 'widgets/home_header.dart';
import 'widgets/summary_card.dart';
import '../../widgets/foot_nav.dart';
import 'widgets/quick_start_section.dart';
import 'widgets/community_challenge_card.dart';

class HomePage extends StatefulWidget {
  final String nama;

  const HomePage({super.key, required this.nama,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    if(_selectedIndex == 0) {
      return SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(nama: widget.nama),
            const SizedBox(height: 20),
            const SummaryCard(),
            const SizedBox(height: 20,),
            QuickStartSection(),
            const SizedBox(height: 20,),
            const CommunityChallengeCard(),
            const SizedBox(height: 20,),
          ],
        ),
      );
    } else if (_selectedIndex == 1) {
      return const Center(child: Text("Stats"),);
    } else if (_selectedIndex == 2 ) {
      return const Center(child: Text("Profile"),);
    } else {
      return const Center(child: Text("Settings"),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(child: _buildBody()),

      bottomNavigationBar: FootNav(currentIndex: _selectedIndex, onTap: _changeTab),
    );
  }
}
