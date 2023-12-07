import 'package:flutter/material.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';

class LoginPage extends StatefulWidget {
 @override
 _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 final _formKey = GlobalKey<FormState>();
 final _emailController = TextEditingController();
 final _passwordController = TextEditingController();

 void _login() {
    if (_formKey.currentState!.validate()) {
      // perform login logic here
      print('Email: ${_emailController.text}, Password: ${_passwordController.text}');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bottom()));
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
        title: Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.network(
                 'https://cdn.pixabay.com/photo/2017/01/31/17/23/clouds-2028998_1280.jpg',
                 width: double.infinity,
                 height: 200,
                 fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                 'Welcome back! Glad to see you, Again!',
                 style: TextStyle(
                    color: Color(0xFF1E232C),
                    fontSize: 20,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                    height: 0.07,
                    letterSpacing: -0.20,
                 ),
                ),
                SizedBox(height: 20),
                TextFormField(
                 controller: _emailController,
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
                SizedBox(height: 10),
                TextFormField(
                 controller: _passwordController,
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
                SizedBox(height: 20),
                ElevatedButton(
                 onPressed: _login,
                 child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
 }
}