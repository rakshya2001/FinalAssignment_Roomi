import 'package:flutter/material.dart';
import 'package:roomandu/app/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'/loginscreen',
      routes: getAppRoutes,
    );
  }
}