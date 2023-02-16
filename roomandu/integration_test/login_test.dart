import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:roomandu/Screen/screeen/login_screen.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  testWidgets('login test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
        routes: {
          '/loginscreen' : (context) => const LoginScreen()
        },
      ),
    );

  });
}



















