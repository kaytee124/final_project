import 'package:final_project/Screens/login_screen.dart';
import 'package:final_project/widgets/activities_card.dart';
import 'package:final_project/widgets/add_transactions_form.dart';
import 'package:final_project/widgets/hero_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: use_build_context_synchronously
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var isLogoutLoading = false;
  logout() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => LoginView()));
    setState(() {
      isLogoutLoading = false;
    });
  }

  final userID = FirebaseAuth.instance.currentUser!.uid;

  _dialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(content: AddTransactionsForm());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (() {
          _dialogBuilder(context);
        }),
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Hello,", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon:
                isLogoutLoading
                    ? CircularProgressIndicator()
                    : Icon(Icons.exit_to_app, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(children: [HeroCard(userId: userID), ActivitiesCard()]),
        ),
      ),
    );
  }
}
