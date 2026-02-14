import 'package:flutter/material.dart';

class FootNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const FootNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.query_stats), label: "Stats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Social"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
