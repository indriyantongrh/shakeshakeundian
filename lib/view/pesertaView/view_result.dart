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
  List<String> messageLists = ['items', 'data'];

  List<String> item = [] ;
  late Channel room;
  late PieSocket piesocket;

  @override
  void initState() {
    super.initState();
    print('arrau init ${item}');
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
    room.listen("new_message", (PieSocketEvent event) {
      var resultpesan = event;
      setState(() {
        item.add(event.getData());
      });

    });

    print('array ${item}');

  }

  Stream<String> _stream() async* {
    room.listen("new_message", (PieSocketEvent event) {
      var resultpesan = event;
      item.add(resultpesan.getData());
      print('arraydd ${item}');
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Result Websocket'),
      ),
      body: Padding(
        padding: EdgeInsets.all(1.0),
        child: Center(
          child:
          new ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  child: Padding(
                    padding: EdgeInsets.all(17.0),
                    child: Text(item[index].toString()),
                  ),
                  color: Colors.cyan[50],
                  height: 50,
                )

              );
            },
            itemCount: item.length,
          )
          // StreamBuilder<String>(
          // stream: _stream(),
          // builder: (BuildContext context,
          //     AsyncSnapshot<String> snapshot){
          //   print('snapshot: ${snapshot.data}');
          //   print('snapshot4: ${item}');
          //   if (snapshot.connectionState == ConnectionState.waiting) {
          //     return CircularProgressIndicator();
          //   } else if (snapshot.connectionState == ConnectionState.active
          //       || snapshot.connectionState == ConnectionState.done) {
          //     if (snapshot.hasError) {
          //       return const Text('Error');
          //     } else if (snapshot.hasData) {
          //       return Text(
          //           snapshot.data.toString(),
          //           style: const TextStyle(color: Colors.red, fontSize: 40)
          //       );
          //     } else {
          //       return
          //     }
          //   } else {
          //     return Text('State: ${snapshot.connectionState}');
          //   }
          // }),
        )
      ),
    );
  }
}
