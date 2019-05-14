import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data;
  List usersData;

  Future getUsers() async {
    http.Response response = await http.get('http://10.0.2.2:4000/api/users');
    // debugPrint(response.body);
    data = json.decode(response.body);
    setState(() {
      usersData = data['users'];
    });
    // debugPrint(usersData.toString());
    debugPrint(usersData.length.toString());
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.builder(
        itemCount: usersData == null ? 0 : usersData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  // Text("${usersData[index]["_id"]} - "),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "$index",
                      style:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  CircleAvatar(
                      backgroundImage:
                          NetworkImage(usersData[index]['avatar'])),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${usersData[index]["firstName"]} ${usersData[index]["lastName"]}",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
