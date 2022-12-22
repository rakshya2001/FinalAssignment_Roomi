import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
Future.delayed(const Duration(seconds: 7),(){
      Navigator.pushReplacementNamed(context,'/loginscreen');
    });
    super.initState();    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/roomi.png',
            width:250,
            height:200,
            fit:BoxFit.fitHeight),
          )
        ],
      )
    );
  }
}