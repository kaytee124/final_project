import 'package:final_project/Screens/login_screen.dart';
import 'package:final_project/services/auth_service.dart';
import 'package:final_project/utils/appvalidator.dart';
import 'package:flutter/material.dart';

//ignore_for_file: prefer_const_constructors
class signup extends StatefulWidget {
  signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _passwordController = TextEditingController();

  var authService = AuthService();
  var isLoader = false;

  Future<void> _submitForm() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });
      var data = {
        "username": _userNameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "password": _passwordController.text,
        'remainingAmount': 0,
        'totalCredit': 0,
        'totalDebit': 0,
      };

      await authService.createUser(data, context);
      setState(() {
        isLoader = false;
      });
    }
  }

  var appvalidator = Appvalidator();

  @override
  Widget build(BuildContext context) {
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
                  "Sign up",
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
                controller: _userNameController,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration('Username', Icons.person),
                validator: appvalidator.validateusername,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration('Email', Icons.email),
                validator: appvalidator.validateEmail,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _phoneController,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.phone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration('Phone Number', Icons.phone),
                validator: appvalidator.validatePhoneNumber,
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
                    backgroundColor: Color.fromARGB(255, 12, 8, 5),
                  ),
                  onPressed: () {
                    isLoader ? print("Loading") : _submitForm();
                  },
                  child:
                      isLoader
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                            "Register",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                ),
              ),
              SizedBox(height: 30.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Color.fromARGB(255, 248, 247, 247),
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
      fillColor: Color(0xAA49A59),
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
