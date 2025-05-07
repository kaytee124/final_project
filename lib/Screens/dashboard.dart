import 'package:final_project/Screens/home_screen.dart';
import 'package:final_project/Screens/transaction_screen.dart';
import 'package:final_project/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var isLogoutLoading = false;
  int currentIndex = 0;
  var pageViewList = [homepage(), TransactionScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        selectedIndex: currentIndex,
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),

      body: pageViewList[currentIndex],
    );
  }
}
