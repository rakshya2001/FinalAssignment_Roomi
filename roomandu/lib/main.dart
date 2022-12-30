


import 'package:flutter/material.dart';
import 'package:roomandu/helper/objectbox.dart';
import 'package:roomandu/state/objectbox_state.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ObjectBoxState.objectBoxInstance= await ObjectBoxInstance.init();
  //create an Object for ObjectBoxInstance

  runApp(
    const MyApp());
}

// class MeroClassScreen extends StatelessWidget {
//   const MeroClassScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 237, 167, 227),
//       appBar: AppBar(
//         title:const Text('first app'),
//         backgroundColor: const Color.fromARGB(255, 90, 167, 203),

//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
          
//           width: double.infinity,
//           color: Colors.amber,
//           child: const Text('hello world',
//           style: TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//             color:Color.fromARGB(255, 186, 71, 62),
//             backgroundColor: Color.fromARGB(255, 167, 174, 235)
//           ),),
//         ),
//       ),
      
      // body:RichText(
      //   text: const TextSpan(
      //     text: 'Hello my name is riya ',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: 30,
      //     ),
      //     children: <TextSpan>[
      //       TextSpan(
      //         text: 'bold',
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white,
      //         ),
      //       ),
      //       TextSpan(
      //         text: 'world! \n',
      //         style: TextStyle(
      //           color: Colors.red,
      //           fontStyle: FontStyle.italic,
      //         ),
      //       ),
      //       TextSpan(
      //         text: 'The future belongs to those who prepare for it today.',
      //       ),
      //     ],
      //   ),
      // )

      // body: const TextField(
      //   decoration: InputDecoration(
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(10.0))
      //     ), 
      //     // kehi lekhda kheri outline border change huncha matlab purple ma hudaina 
      //     enabledBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: Colors.purple,width: 5),
      //     ),
      //     // tap garda tehi color aauna lai 
      //     focusedBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: Colors.purple,width: 5)
      //     ),
//       //     labelText: 'Enter your name '
//         );
//   }
// }