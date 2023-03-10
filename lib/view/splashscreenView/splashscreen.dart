import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shakeshakeundian/view/loginView/login.dart';
/**
 *  Create by Indriyantongrh on 24/01/23
 */
class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    startSplashScreen();
  }

  startSplashScreen() async {

    var duration = const Duration(seconds: 5);
    return Timer(duration, () async{
      // if(login == true) {
      //   SharedPreferences pref = await SharedPreferences.getInstance();
      //   setState(() {
      //     idUsers = pref.getString("idUsers");
      //     idReports = pref.getString("idReports");
      //
      //   });
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (_) {
      //       return MenuUtama();
      //     }),
      //   );
      // }else{
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (_) {
      //       return Login();
      //     }),
      //   );
      // }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return Login();
        }),
      );

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:   Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 90.0,
                          child: Text('Logo', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),)
                          // Image.asset("assets/logoapps.png",
                          //   height: 300,
                          //   width: 350,)
                      ),
                      CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                        strokeWidth: 2,
                      ),
                      /*Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),*/

                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


}



