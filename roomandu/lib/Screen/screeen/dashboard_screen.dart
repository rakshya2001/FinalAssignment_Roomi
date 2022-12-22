import 'package:flutter/material.dart';
import 'package:roomandu/Screen/screeen/login_screen.dart';
import 'package:roomandu/Screen/screeen/register_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final int _selectIndex=0;

  List<Widget> lstBottomScreen=[
    const LoginScreen(),
    RegisterScreen()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: lstBottomScreen[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            ),
        ],
      ),
    );
  }
}