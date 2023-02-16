
import 'package:flutter/material.dart';
import 'package:roomandu/helper/objectbox.dart';
import 'package:roomandu/state/objectbox_state.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'app/app.dart';

void main() async{
  AwesomeNotifications().initialize(
    'resource://drawable/launcher',
    [
      NotificationChannel(
        channelKey:'basic_channel',
        channelName:'Basic notifications',
        channelDescription:'Notification channel for basic tests',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
      )
    ]
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // ObjectBoxState.objectBoxInstance= await ObjectBoxInstance.init();
  // //create an Object for ObjectBoxInstance

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

