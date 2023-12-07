import 'package:flutter/material.dart';
import 'package:managment/Screens/Login.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterPage extends StatefulWidget {
 @override
 _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _usernameController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
 final TextEditingController _confirmPasswordController = TextEditingController();

 Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      // Save the user's email, username, and password in the local app storage.
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', _emailController.text);
      prefs.setString('username', _usernameController.text);
      prefs.setString('password', _passwordController.text);

      // Display a snackbar indicating successful registration.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Registration successful!'),
      ));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset('assets/images/app_icon.png'),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 'Hello! Register to get started',
                 style: TextStyle(
                    color: Color(0xFF1E232C),
                    fontSize: 20,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                    height: 0.07,
                    letterSpacing: -0.20,
                 ),
                ),
                SizedBox(height: 32.0),
                TextFormField(
                 controller: _emailController,
                 keyboardType: TextInputType.emailAddress,
                 decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                 ),
                 validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                 },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                 controller: _usernameController,
                 decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                 ),
                 validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                 },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                 controller: _passwordController,
                 obscureText: true,
                 decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                 ),
                 validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                 },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                 controller: _confirmPasswordController,
                 obscureText: true,
                 decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                 ),
                 validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                 },
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                 onPressed: _register,
                 child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
 }
}