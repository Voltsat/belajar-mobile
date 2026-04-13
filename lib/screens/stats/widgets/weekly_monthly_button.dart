import 'package:flutter/material.dart';

class WeeklyMonthlyButton extends StatefulWidget {
  final bool isWeekly;
  final Function(bool) onChanged;

  const WeeklyMonthlyButton({
    super.key,
    required this.isWeekly,
    required this.onChanged,
  });

  @override
  State<WeeklyMonthlyButton> createState() => _WeeklyMonthlyButtonState();
}

class _WeeklyMonthlyButtonState extends State<WeeklyMonthlyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: toggleItem("Weekly", true)),
          Expanded(child: toggleItem("Monthly", false)),
        ],
      ),
    );
  }

  Widget toggleItem(String text, bool value) {
    bool selected = widget.isWeekly == value;

    return GestureDetector(
      onTap: () {
        widget.onChanged(value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
