import 'package:flutter/material.dart';
import 'package:roomandu/repository/user_repo.dart';
// import 'package:roomandu/Screen/screeen/dashboard_screen.dart';

import 'package:wear/wear.dart';

class LoginScreenWatch extends StatefulWidget {
  const LoginScreenWatch({super.key});

  @override
  State<LoginScreenWatch> createState() => _LoginScreenWatchState();
}

class _LoginScreenWatchState extends State<LoginScreenWatch> {
  final usernamecontroller = TextEditingController(text: "Rakshya");
  final passwordcontoller = TextEditingController(text: "rakshya123");
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _goToAnotherPage() {
      Navigator.pushNamed(context, "/wearosscreen");
    }

    _loginuser() async {
      var status = await UserRepositoryImp()
          .login(usernamecontroller.text, passwordcontoller.text);
      if (status == true) {
        _goToAnotherPage();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User Login Failed"),
          ),
        );
      }
    }

    return WatchShape(builder: (BuildContext context, shape, child) {
      return AmbientMode(
        builder: (context, mode, child) => Scaffold(
            body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                 SizedBox(height: size.height * 0.03),
                  TextFormField(
                    controller: usernamecontroller,
                    decoration: const InputDecoration(
                      labelText: "Username"
                    ),
                    onSaved: (value) {
                    setState(() {
                        usernamecontroller.text = value.toString();
                    });
                    },
                  ),
                SizedBox(height: size.height * 0.03),
                  TextFormField(
                    controller: passwordcontoller,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      setState(() {
                      passwordcontoller.text = value.toString();
                        
                      });
                    },
                  ),

                
                ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        _loginuser();
                      }
                    },
                    child: const Text("login"))
              ],
            ),
          ),
        )),
      );
    });
  }
}
