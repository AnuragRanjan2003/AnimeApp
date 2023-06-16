import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/screens/login.dart';
import 'package:flutter_projects/screens/main_screen.dart';
import 'package:flutter_projects/screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'main',
    theme: ThemeData(fontFamily: 'Poppins', primarySwatch: Colors.pink),
    debugShowCheckedModeBanner: false,
    routes: {
      'login': (context) {
        return const LoginScreen();
      },
      'register': (context) {
        return const RegisterScreen();
      },
      'main': (_) {
        return const MainScreen();
      }
    },
  ));
}
