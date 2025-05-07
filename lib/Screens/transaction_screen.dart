import 'package:final_project/widgets/category_list.dart';
import 'package:final_project/widgets/tab_bar_view.dart';
import 'package:final_project/widgets/time_line_month.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String monthYear = DateFormat('MMM y').format(DateTime.now());
  String category = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TimeLineMonth(
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  monthYear = value;
                });
              }
            },
          ),
          CategoryList(
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  category = value;
                });
              }
            },
          ),
          TypeTabBar(category: category, monthYear: monthYear),
        ],
      ),
    );
  }
}
