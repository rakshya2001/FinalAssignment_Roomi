import 'package:flutter/material.dart';
import 'package:roomandu/Screen/screeen/dashboard_screen.dart';
import 'package:roomandu/Screen/screeen/login_screen.dart';
import 'package:roomandu/Screen/screeen/register_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'User Register',
      debugShowCheckedModeBanner: false,
      initialRoute:'/',
      routes: {
        '/':(context) => const LoginScreen(),
        '/registerScreen':(context) =>   RegisterScreen(),
        '/dashboardScreen':(context) => const DashboardScreen()
      },

    );
  }
}