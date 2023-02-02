import 'package:flutter/material.dart';
import 'package:shakeshakeundian/view/splashscreenView/splashscreen.dart' as alias;
import 'package:shake/shake.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login",
    home: alias.Splashscreen(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Shake Shake Undian',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Shake Shake Undian'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int shakeCounter = 0;
//   @override
//   Widget build(BuildContext context) {
//     ShakeDetector.autoStart(onPhoneShake: () {
//       setState(() {
//         shakeCounter++;
//       });
//     });
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Anda telah shake',
//             ),
//             Text(
//               '$shakeCounter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
