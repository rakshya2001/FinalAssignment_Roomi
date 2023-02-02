import 'package:flutter/material.dart';
import 'package:roomandu/Screen/screeen/register_screen.dart';
import 'package:roomandu/repository/user_repo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'Rakshya');
  final _passwordController = TextEditingController(text: 'rakshya123');
  _signIn() async {
    try {
      var userRep = await UserRepositoryImp()
          .signUp(_usernameController.text, _passwordController.text);
      print(userRep.username);
      print(userRep.password);
      print(userRep.userId);
      if (userRep.username == _usernameController.text &&
          userRep.password == _passwordController.text) {
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset('assets/images/roomi.png',
                        width: 250, height: 200, fit: BoxFit.fitHeight),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 136, 34),
                          fontSize: 36),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: "Username"
                    ),
                    onSaved: (value) {
                    setState(() {
                        _usernameController.text = value.toString();
                    });
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      setState(() {
                      _passwordController.text = value.toString();
                        
                      });
                    },
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: const Text(
                      "Forgot your password?",
                      style: TextStyle(
                          fontSize: 12, color: Color.fromARGB(255, 255, 136, 34)),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    alignment: Alignment.centerRight,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        if(_key.currentState!.validate()) {
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
                            borderRadius: BorderRadius.circular(40.0),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 255, 136, 34),
                              Color.fromARGB(255, 255, 177, 41)
                            ])),
                        padding: const EdgeInsets.all(0),
                        child: const Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()))
                      },
                      child: const Text(
                        "Don't Have an Account? Sign up",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
