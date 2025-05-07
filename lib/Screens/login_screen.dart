import 'package:final_project/Screens/sign_up.dart';
import 'package:final_project/services/auth_service.dart';
import 'package:final_project/utils/appvalidator.dart';
import 'package:flutter/material.dart';

//ignore_for_file: prefer_const_constructors
class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var authService = AuthService();
  var isLoader = false;

  Future<void> _submitForm() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });
      var data = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };

      await authService.login(data, context);

      setState(() {
        isLoader = false;
      });
    }
  }

  var appvalidator = Appvalidator();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 25, 83),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 80.0),
              SizedBox(
                width: 250,
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              TextFormField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration('Username', Icons.person),
                validator: appvalidator.validateusername,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                style: TextStyle(color: Colors.white),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration('Password', Icons.lock),
                validator: appvalidator.validatePassword,
              ),
              SizedBox(height: 40.0),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 8, 8, 8),
                  ),
                  onPressed: () {
                    isLoader ? print("Loading") : _submitForm();
                  },
                  child:
                      isLoader
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                            "Login",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 255, 254, 254),
                              fontSize: 20,
                            ),
                          ),
                ),
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signup()),
                  );
                },
                child: Text(
                  "Signup",
                  style: TextStyle(
                    color: Color.fromARGB(255, 252, 250, 249),
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
      fillColor: Color.fromARGB(9, 2, 18, 238),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x35949494)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      filled: true,
      labelStyle: TextStyle(color: Color(0xFF949494)),
      labelText: label,
      suffixIcon: Icon(suffixIcon, color: Color(0xFF949494)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
