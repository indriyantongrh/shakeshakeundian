import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:piesocket_channels/channels.dart';

/**
 *  Create by Indriyantongrh on 24/01/23
 */

class Countershake extends StatefulWidget {
  const Countershake({Key? key}) : super(key: key);

  @override
  State<Countershake> createState() => _CountershakeState();
}

class _CountershakeState extends State<Countershake> {
  int shakeCounter = 0;
  String pesan = '';
  late Channel room;
  late PieSocket piesocket;

  @override
  void initState() {
    super.initState();
    // streamListener();
  }

  streamListener(value) {
    var options = PieSocketOptions();
    options.setClusterId("s8331.sgp1");
    options.setApiKey("1t33gl9eZvupfxkKdc3rUzHyib6VNQlyzNf9DDcq");
    // options.setForceAuth(true);
    options.setAuthEndpoint("https://www.piesocket.com");
    options.setPresence(true);

    // var headers = {"Client": "undian"};
    // options.setAuthHeaders(headers);

    piesocket = PieSocket(options);
    room = piesocket.join("1");

    // room.listen("system:connected", (PieSocketEvent event) {
    //   //Channel is connected
    //   setState(() {
    //     print('masuk ${shakeCounter}');
    //   });
    //   //Create an event
    //   PieSocketEvent newMessage = PieSocketEvent("new_message");
    //   newMessage.setData( shakeCounter.toString());
    //
    //   //Publish event
    //   room.publish(newMessage);
    //   // print('masuk ${event}' );
    // });
    //
    // room.listen("system:message", (PieSocketEvent event) {
    //
    //   var resultpesan = event;
    //   print(resultpesan);
    // });
  }

  @override
  Widget build(BuildContext context) {
    var options = PieSocketOptions();
    options.setClusterId("s8331.sgp1");
    options.setApiKey("1t33gl9eZvupfxkKdc3rUzHyib6VNQlyzNf9DDcq");
    // options.setForceAuth(true);
    options.setAuthEndpoint("https://www.piesocket.com");
    options.setPresence(true);

    // var headers = {"Client": "undian"};
    // options.setAuthHeaders(headers);

    piesocket = PieSocket(options);
    room = piesocket.join("1");

    ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        shakeCounter++;
        print(shakeCounter);
        PieSocketEvent newMessage = PieSocketEvent("new_message");
        newMessage.setData(shakeCounter.toString());
        room.publish(newMessage);
        // var options = PieSocketOptions();
        // options.setClusterId("s8331.sgp1");
        // options.setApiKey("1t33gl9eZvupfxkKdc3rUzHyib6VNQlyzNf9DDcq");
        // // options.setForceAuth(true);
        // options.setAuthEndpoint("https://www.piesocket.com");
        // options.setPresence(true);
        //
        // // var headers = {"Client": "undian"};
        // // options.setAuthHeaders(headers);
        //
        // piesocket = PieSocket(options);
        // room = piesocket.join("1");
        // room.listen("system:connected", (PieSocketEvent event) {
        //   //Channel is connected
        //   //Create an event
        //   PieSocketEvent newMessage = PieSocketEvent("new_message");
        //   newMessage.setData(shakeCounter.toString());
        //
        //   //Publish event
        //   room.publish(newMessage);
        //   // print('masuk ${event}' );
        // });
        //
        // // room.listen("system:message", (PieSocketEvent event) {
        // //
        // //   var resultpesan = event;
        // //   print(resultpesan);
        // // });
      });
    },
      shakeThresholdGravity: 5.9,
    );
    return  Scaffold(
        appBar: AppBar(
          title: Text('Undian'),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                  AssetImage("assets/bgstart.png"), fit: BoxFit.fill
                  // Image.asset('assets/login.gif', width: 15.0, height: 15.0)
              )
          ),
          child:   Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Shake yang kencang'),
                Text(
                  'Anda telah shake',
                ),
                Text(
                  '$shakeCounter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//
// class Countshake extends StatelessWidget {
//   const Countshake({super.key});
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
//
//   //
//   // @override
//   // void initState() {
//   //
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     ShakeDetector.autoStart(onPhoneShake: () {
//       setState(() {
//         shakeCounter++;
//       });
//     },
//       shakeThresholdGravity: 5.9,
//     );
//     return
//       Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image:
//             AssetImage("assets/bgstart.svg")
//           )
//         ),
//         child:   Center(
//           child: Column(
//
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Anda telah shake',
//               ),
//               Text(
//                 '$shakeCounter',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ],
//           ),
//         ),
//       )// This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//
//



