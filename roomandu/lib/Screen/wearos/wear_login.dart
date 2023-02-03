import 'package:flutter/material.dart';
// import 'package:roomandu/Screen/screeen/dashboard_screen.dart';
import 'package:roomandu/repository/user_repo.dart';
import 'package:wear/wear.dart';

class WearLoginScreen extends StatefulWidget {
  const WearLoginScreen({super.key});

  @override
  State<WearLoginScreen> createState() => _WearLoginScreenState();
}

class _WearLoginScreenState extends State<WearLoginScreen> {
  final formkey = GlobalKey<FormState>();
  final gap = const SizedBox(height: 20);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  _signIn() async {
    try {
      var userRep = await UserRepositoryImp()
          .login(_usernameController.text, _passwordController.text);
     if(userRep) {
        Navigator.pushNamed(context, "/dashboardScreen");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Login Successfully",
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 4),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Login Failed",
          ),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 4),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WatchShape(
        builder: (BuildContext context, WearShape, Widget? child) {
      return AmbientMode(
        builder: (context, mode, child) {
          return SafeArea(
            child: Scaffold(
              body: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                              fontFamily: "Montserrant Bold",
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2661FA),
                              fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      gap,
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          style: const TextStyle(
                            fontFamily: "Montserrant",
                          ),
                          decoration: const InputDecoration(
                            labelText: "Username",
                          ),
                          controller: _usernameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                        ),
                      ),
                      gap,
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          style: const TextStyle(
                            fontFamily: "Montserrant",
                          ),
                          decoration:
                              const InputDecoration(labelText: "Password"),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                      ),
                      gap,
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              _signIn();
                            }
                           
                            
                          },
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                          // textColor: Colors.white,
                          // padding: const EdgeInsets.all(0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            width: size.width * 0.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80.0),
                                gradient: const LinearGradient(colors: [
                                  Color.fromARGB(255, 255, 136, 34),
                                  Color.fromARGB(255, 255, 177, 41)
                                ])),
                            padding: const EdgeInsets.all(0),
                            child: const Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
