import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth.dart';
import 'users_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(CallApp());
}

class CallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthScreen(),
      routes: {
        '/users': (_) => UsersListScreen(),
      },
    );
  }
}