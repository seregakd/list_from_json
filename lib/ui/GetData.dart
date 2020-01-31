import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

class GetData extends StatefulWidget {
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  List data;

  Future<String> getDataFromJson() async {
    String dataJson = await rootBundle.loadString('assets/DataItems.json');

    setState(() {
      data = json.decode(dataJson);
    });
  }

  @override
  void initState() {
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
        itemCount: data == null ? 0 : data.length,
        cacheExtent: 100,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text(data[index]["title"]),
          );
        }
    );
  }
}