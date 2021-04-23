import 'package:devquiz/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: HomePage(),
    );
  }
}

// class AppWidget extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'DevQuiz',
//       home: Scaffold(
//         appBar: AppBar(title: Text("NLW5 Flutter")),
//         body: Center(
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.purple,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Text("Olá, Alex Tavella",
//               style: TextStyle(fontSize: 30),
//             ),
//           )
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: (){},
//           child: Icon(Icons.add)
//         ),
//       ),
//     );
//   }
// }
