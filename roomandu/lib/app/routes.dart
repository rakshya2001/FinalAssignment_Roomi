import 'package:flutter/material.dart';
import 'package:roomandu/Screen/bottom_screen/cart.dart';
import 'package:roomandu/Screen/bottom_screen/category.dart';
import 'package:roomandu/Screen/bottom_screen/profile.dart';
import 'package:roomandu/Screen/screeen/dashboard_screen.dart';
import 'package:roomandu/Screen/screeen/splash.dart';
import 'package:roomandu/Screen/wearos/wear_dashboard.dart';
import 'package:roomandu/Screen/wearos/wear_login.dart';

import '../Screen/screeen/login_screen.dart';
import '../Screen/screeen/register_screen.dart';

var getAppRoutes = <String, WidgetBuilder>{
  "/" : (context) => const SplashScreen(),
  "/loginscreen": (context) => const LoginScreen(),
  "/registerScreen": (context) => const RegisterScreen(),
  "/homepage": (context) => const DashboardScreen(),
  "/cartscreen": (context) => const CartScreen(),
  "/categoryscreen": (context) => const CategoryScreen(),
  "/profilescreen": (context) => const ProfileScreen(),
  "/wearosscreen":(context) => const WearDashboardScreen(),
  "/wearscreen":(context) => const LoginScreenWatch()
};