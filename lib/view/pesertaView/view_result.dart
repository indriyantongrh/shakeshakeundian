import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'package:piesocket_channels/channels.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:google_fonts/google_fonts.dart';

/**
 *  Create by Indriyantongrh on 03/02/23
 */
class ViewResult extends StatefulWidget {
  const ViewResult({Key? key}) : super(key: key);

  @override
  _ViewResultState createState() => _ViewResultState();
}

class _ViewResultState extends State<ViewResult> {
  String Result = '0';
  List<String> messageList = [];

  List<String> item = [] ;
  late Channel room;
  late PieSocket piesocket;

  @override
  void initState() {
    super.initState();
    streamListener();
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

    // room.listen("system:message", (PieSocketEvent event) {
    //
    //   var resultpesan = event;
    //   Result = event.toString();
    //   print(resultpesan);
    // });
  }

  Stream<String> _stream() async* {
    room.listen("new_message", (PieSocketEvent event) {
      var resultpesan = event;
      // item.add(event);
      item.add(resultpesan.getData());
      print(resultpesan.getData());
      print('array ${item}');
      // messageList.add(resultpesan.getData());

    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = [];
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Websocket'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child:
          new StreamBuilder(
          stream: _stream(),
          builder: ( BuildContext context,AsyncSnapshot snapshot){
            print('snapshot: ${snapshot}');
            if (snapshot.hasData) {
              return ListView(
                children: [],
              )
            } else if (snapshot.hasError) {
            return Text('Error');
            } else {
            return Center(child: CircularProgressIndicator());
            }

          }),
        )
      ),
    );
  }
  // ListView getMessageList() {
  //   List<Widget> listWidget = [];
  //
  //   for (String message in messageList) {
  //     listWidget.add(ListTile(
  //       title: Container(
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text(
  //             message,
  //             style: TextStyle(fontSize: 22),
  //           ),
  //         ),
  //         color: Colors.teal[50],
  //         height: 60,
  //       ),
  //     ));
  //   }
  //
  //   return ListView(children: listWidget);
  // }
}

