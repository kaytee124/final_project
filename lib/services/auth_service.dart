import 'package:final_project/Screens/dashboard.dart';
import 'package:final_project/services/db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  var db = Db();
  createUser(data, context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      // Remove password from data before storing in Firestore
      final userData = Map<String, dynamic>.from(data)..remove('password');
      await db.addUser(userData, context);
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard()));
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Sign up Failed"),
            content: Text(e.toString()),
          );
        },
      );
    }
  }

  login(data, context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard()));
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Login Error"),
            content: Text(e.toString()),
          );
        },
      );
    }
  }
}
