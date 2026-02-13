import 'package:flutter/material.dart';
import '../widgets/home_header.dart';
import '../widgets/summary_card.dart';

class Homepage extends StatelessWidget {
  final String nama;

  const Homepage({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(nama: nama),
              const SizedBox(height: 20),
              const SummaryCard(),
            ],
          ),
        ),
      ),
    );
  }
}
