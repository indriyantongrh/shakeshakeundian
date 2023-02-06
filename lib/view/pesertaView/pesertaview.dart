import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:piesocket_channels/channels.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:google_fonts/google_fonts.dart';
/**
 *  Create by Indriyantongrh on 02/02/23
 */
class Pesertaview extends StatefulWidget {
  // final WebSocketChannel channel;

  const Pesertaview({Key? key}) : super(key: key);
  @override
  _PesertaviewState createState() => _PesertaviewState();
}

class _PesertaviewState extends State<Pesertaview> {
  String pesan = "";
  TextEditingController _controller = TextEditingController();
  // final channel = IOWebSocketChannel.connect('wss://socketsbay.com/wss/v2/1/ef185f1dbb2ee3381a51f42c0ff665a0/');
  final channel = IOWebSocketChannel.connect('ws://socketsbay.com/wss/v2/1/ef185f1dbb2ee3381a51f42c0ff665a0/');
  // final channel = IOWebSocketChannel.connect(
  //     'wss://socketsbay.com/wss/v2/1/ef185f1dbb2ee3381a51f42c0ff665a0/');
  late Channel room;
  late PieSocket piesocket;

  @override
  void initState() {
    super.initState();
    streamListener();
    channel.sink.add("Hello World");

  }
  streamListener() {
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

    // room.listen("*", (PieSocketEvent event) {
    //   print("EVENT!");
    //   print(event.toString());
    // });
    //
    // room.listen("system:message", (PieSocketEvent event) {
    //   print("MESSAGE!");
    //   print(event.toString());
    //
    // });

    room.listen("system:connected", (PieSocketEvent event) {
      //Channel is connected

      //Create an event
      PieSocketEvent newMessage = PieSocketEvent("new_message");
      newMessage.setData(pesan);

      //Publish event
      room.publish(newMessage);
      // print('masuk ${event}' );
    });

    room.listen("system:message", (PieSocketEvent event) {

      var resultpesan = event;
      print(resultpesan);
    });

    // channel.stream.listen((message) {
    //   channel.sink.add("Hello World");
    //   // channel.sink.close(status.goingAway);
    //   print(channel.stream);
    // //   Map getData = jsonDecode(message);
    // //   // setState(() {
    // //   //   btcUsdtPrice = getData['p'];
    // //   // });
    // //   print(getData);
    // });
  }
  void sendData() async{
    PieSocketEvent newMessage = PieSocketEvent("new_message");
    newMessage.setData(_controller.text);
    room.publish(newMessage);
    // channel.sink.add(_controller.text);
    // print('tesss');
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Undian'),
      ),
      body:

      new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                  new Form(
                      child: new TextField(
                        decoration:  new InputDecoration( labelText: 'masukan massage'),
                        controller: _controller,
                      )
                  ),
                  Container(
                      height: 50,
                      margin:
                      EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              sendData();
                            });
                          },
                          child: Text(
                              "Kirim",
                              style: GoogleFonts.poppins(fontSize: 18 ,color: Colors.black, fontWeight: FontWeight.w400)
                          ),
                        ),
                      )),


              // Center(
              //   child: new StreamBuilder(
              //       stream: channel.stream,
              //       builder: (context, snapshot){
              //         return new Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: new Text(snapshot.hasData ? '${snapshot.data}' : ''),
              //         );
              //       }),
              // )
            ],
          ),
      )
    );
  }
}
