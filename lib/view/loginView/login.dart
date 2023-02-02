import 'package:flutter/material.dart';
import 'package:shakeshakeundian/view/countshakeView/countshake.dart' ;
import 'package:google_fonts/google_fonts.dart';
/**
 *  Create by Indriyantongrh on 24/01/23
 */
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text(
              //   "LOGIN",
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              // SizedBox(height: size * 2),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 5,
                    child: Image.asset("assets/loginicon.png"),
                  ),
                  const Spacer(),
                ],
              ),
              Form(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  "Welcome! Login with your credintials.",
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white60,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(8.0),

                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            // border: InputBorder.none,
                                              hintText: "Masukan Nomor Rekening",
                                              border: myinputborder(),
                                              prefixIcon: const Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 3.0),
                                                  child: const Icon(
                                                      Icons.person)
                                              )),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          decoration: InputDecoration(

                                            // hintStyle: GoogleFonts.poppins(color: Color(0xFFBDBDBD)),
                                            // border: InputBorder.none,
                                              hintText: "Nomor Handphone",
                                              border: myinputborder(),
                                              prefixIcon: const Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 3.0),
                                                  child:
                                                  const Icon(Icons.lock))),
                                          //
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    height: 50,
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blueAccent),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            Navigator.of(context).push(new MaterialPageRoute(
                                                builder: (BuildContext context) => Countershake()));
                                          });
                                        },
                                        child: Text(
                                            "Login",
                                            style: GoogleFonts.poppins(fontSize: 20 ,color: Color(0xFFFFFFFF), fontWeight: FontWeight.w600)
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        )

      ),
    );

  }

  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.redAccent,
          width: 3,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.greenAccent,
          width: 3,
        )
    );
  }
}

