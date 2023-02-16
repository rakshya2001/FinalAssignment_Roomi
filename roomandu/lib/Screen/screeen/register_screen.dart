import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
// import 'package:roomandu/data_source/local_data_source/role_data_source.dart';
// import 'package:roomandu/model/role.dart';
import 'package:roomandu/model/user.dart';
import 'package:roomandu/repository/user_repo.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String route ="registerScreen";
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // late List<Role> _lstRoles = [];
  late final  String _dropDownValue= "";
  final _key = GlobalKey<FormState>();
  final _firstNameController = TextEditingController(text: 'Rakshya');
  final _lastNameController = TextEditingController(text: 'Bhatta');
  final _phoneNumberController = TextEditingController(text: '9848425833');
  final _usernameController = TextEditingController(text: 'Rakshya');
  final _passwordController = TextEditingController(text: 'rakshya123');


  _showMessage(int status){
    if(status > 0){
      MotionToast.success(description: const Text('User Added Successfully'),
      ).show(context);
    }else{
      MotionToast.error(description: const Text('Error in adding role.'))
      .show(context);
    }
  }

  _saveUser() async{
    User user = User(
      firstName:_firstNameController.text,
     lastName: _lastNameController.text,
      username:_usernameController.text,
     phoneNumber: _phoneNumberController.text,
      password:_passwordController.text,
    );


    int status = await  UserRepositoryImp().addUser(user);
    _showMessage(status);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                "REGISTER",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 136, 34),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: const TextField(
                decoration: InputDecoration(labelText: " Full Name"),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: const TextField(
                decoration: InputDecoration(labelText: "Mobile Number"),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: const TextField(
                decoration: InputDecoration(labelText: "Username"),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: const TextField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  _saveUser();
                },
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
                    "SIGN UP",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()))
                },
                child: const Text(
                  "Already Have an Account? Sign in",
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
    );
  }
}
