import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Colors.white,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 60,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home, color: Colors.black),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.explore),
          selectedIcon: Icon(Icons.explore, color: Colors.black),
          label: 'History',
        ),
      ],
    );
  }
}
