import 'package:flutter/material.dart';

class StatsHeader extends StatelessWidget {
  const StatsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Progress',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Keep up the momentum!',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF02f202), width: 3),
                ),
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.person, size: 26),
                ),
              ),

              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 14,
                  width: 14,
                  decoration: BoxDecoration(
                    color: Color(0xFF02f202),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
