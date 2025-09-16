import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passController.text);
      Navigator.pushReplacementNamed(context, '/users');
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void _register() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passController.text);
      Navigator.pushReplacementNamed(context, '/users');
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Login/Register')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _signIn, child: Text('Sign In')),
            ElevatedButton(onPressed: _register, child: Text('Register')),
          ]),
        ));
  }
}