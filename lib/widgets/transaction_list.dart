import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/widgets/activity_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  TransactionList({
    super.key,
    required this.category,
    required this.monthYear,
    required this.type,
  });

  final userId = FirebaseAuth.instance.currentUser!.uid;
  final String category;
  final String monthYear;
  final String type;

  @override
  Widget build(BuildContext context) {
    Query query = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection("transactions")
        .orderBy('timestamp', descending: true)
        .where('monthyear', isEqualTo: monthYear)
        .where('type', isEqualTo: type);

    if (category != 'All') {
      query = query.where('category', isEqualTo: category);
    }

    return StreamBuilder<QuerySnapshot>(
      stream: query.limit(150).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('Firestore error: ${snapshot.error}'); // Debug
          return const Center(
            child: Text(
              'Failed to load transactions. Please try again.',
              textAlign: TextAlign.center,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading"));
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No transactions found'));
        }

        var data = snapshot.data!.docs;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var cardData = data[index];
            return ActivityCard(data: cardData);
          },
        );
      },
    );
  }
}
