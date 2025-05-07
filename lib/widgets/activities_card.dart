import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/widgets/activity_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ActivitiesCard extends StatelessWidget {
  ActivitiesCard({super.key});
  //ignore_for_file: prefer_const_constructors

  //ignore_for_file:prefer_count_literals_to_create_immutables

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Recent activity",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          RecentActivityList(),
        ],
      ),
    );
  }
}

class RecentActivityList extends StatelessWidget {
  RecentActivityList({super.key});

  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection("transactions")
              .orderBy('timestamp', descending: false)
              .limit(10)
              .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No activities found'));
        }

        var data = snapshot.data!.docs;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var cardData = data[index];
            return ActivityCard(data: cardData);
          },
        );
      },
    );
  }
}
