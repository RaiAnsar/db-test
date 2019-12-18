import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.white60,
          primarySwatch: Colors.red,
          brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      title: 'Database Test',
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  getMethod() async {
    String theURL = "http://lmdbapplication.000webhostapp.com/getData.php";
    var res = await http
        .get(Uri.encodeFull(theURL), headers: {"Accept": "application/json"});
    var responseBody = json.decode(res.body);
    print(responseBody);

    return responseBody;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DB Test'),
        ),
        body: FutureBuilder(
          future: getMethod(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List snap = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error Fetching Data"),
              );
            }
            return ListView.builder(
              itemCount: snap.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("ID ${snap[index]['id']} Country: ${snap[index]['country']}"),
                  subtitle: Text("ISO: ${snap[index]['iso']} ISO3: ${snap[index]['iso3']}"),
                  
                );
              },
            );
          },
        ));
  }
}
