import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List from JSON',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;

  Future<String> getDataFromJson() async {
    String dataJson = await rootBundle.loadString('assets/data.json');
//    print(dataJson);
    data = json.decode(dataJson);
    print(data[1]["title"]);
    return dataJson;
  }

  @override
  void initState(){
    getDataFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text("List")
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return new ListView.builder(
//        padding: const EdgeInsets.all(16.0),
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index){
        return new Card(
           child: new Text(data[index]["title"]),
        );
      }
    );
  }


}
