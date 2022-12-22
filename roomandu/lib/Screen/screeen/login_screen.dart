import 'package:division/division.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset("assets/images/roomi.png"),
                TextFormField(
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    //add prefix icon
                    prefixIcon: const Icon(
                      Icons.person_outline_rounded,
                      color: Colors.grey,
                    ),
        
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
        
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    //add prefix icon
                    prefixIcon: const Icon(
                      Icons.person_outline_rounded,
                      color: Colors.grey,
                    ),
        
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
        
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Parent(
                  style: ParentStyle()
                    ..height(52)
                    ..elevation(4, color: Colors.grey)
                    ..width(screen.width)
                    ..borderRadius(all: 16)
                    ..background.color(const Color.fromARGB(255, 152, 11, 25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Txt(
                        "Login",
                        style: TxtStyle()
                          ..fontSize(20)
                          ..alignmentContent.center(true)
                          ..fontWeight(FontWeight.bold)
                          ..textColor(Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                ElevatedButton(onPressed: (){
                  
                }, child: const Text("Register"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}