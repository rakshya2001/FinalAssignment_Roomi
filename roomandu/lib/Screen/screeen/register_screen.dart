import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:motion_toast/motion_toast.dart';
// import 'package:roomandu/data_source/local_data_source/role_data_source.dart';
// import 'package:roomandu/model/role.dart';
import 'package:roomandu/model/user.dart';
import 'package:roomandu/repository/user_repo.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String route = "registerScreen";
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? _img;

  Future _browseImage(ImageSource imageSource) async {
    try {
      // Source is either Gallary or Camera
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // late List<Role> _lstRoles = [];
  late final String _dropDownValue = "";
  final _key = GlobalKey<FormState>();
  final _firstNameController = TextEditingController(text: "sanjog  ");
  final _lastNameController = TextEditingController(text: "regmi");
  final _phoneNumberController = TextEditingController(text: "9841234567");
  final _usernameController = TextEditingController(text: "sanjog");
  final _passwordController = TextEditingController(text: "123456478");
  final _emailController = TextEditingController(text: "mailsanjog.regmi");

  _showMessage(int status) {
    if (status > 0) {
      MotionToast.success(
        description: const Text('User Added Successfully'),
      ).show(context);
    } else {
      MotionToast.error(description: const Text('Error in adding role.'))
          .show(context);
    }
  }

  _saveUser() async {
    User user = User(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      username: _usernameController.text,
      phoneNumber: _phoneNumberController.text,
      password: _passwordController.text,
      email: _emailController.text,
    );

    int status = await UserRepositoryImp().addUser(_img, user);
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
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Profile image : ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            //
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                              onPressed: () {
                                _browseImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                              label: const Text("camera"),
                              icon: const Icon(Icons.camera)),
                          ElevatedButton.icon(
                              onPressed: () {
                                _browseImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                              label: const Text("gallery"),
                              icon: const Icon(Icons.image)),
                        ],
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: _img == null
                          ? const Icon(
                              Icons.person,
                              size: 50,
                            )
                          : CircleAvatar(
                              radius: 100, child: Image.file(_img!))),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: " first Name"),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: " lastname "),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: " Email "),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(labelText: "Mobile Number"),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Username"),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
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
