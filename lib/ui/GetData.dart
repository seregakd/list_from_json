import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:list_from_json/model/DataFromJson.dart';

class GetData extends StatefulWidget {
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  Map <String, String> itemsMap = Map <String, String>();
  Map <String, String> usersMap = Map <String, String>();
  bool _delay = true;

  void getDataItemsFromJson() async {
    List dataItems = json.decode(await rootBundle.loadString('assets/DataItems.json'));

    itemsMap = Map.fromIterable(dataItems,
        key: (item) => item["title"],
        value: (item) => item["body"]);

    waitData();
  }

  void getDataUsersFromJson() async {
    List dataUsers = json.decode(await rootBundle.loadString('assets/DataUsers.json'));

    usersMap = Map.fromIterable(dataUsers,
        key: (item) => item["user"],
        value: (item) => item["password"]);

    waitData();
  }

  void delay() async {
    await Future.delayed(const Duration(seconds: 2));
    _delay = false;
    waitData();
  }

  void waitData() {
    if (itemsMap != null && usersMap != null && _delay == false) {
      Navigator.pushReplacementNamed(context, '/login',
          arguments: DataFromJson(itemsMap, usersMap),
      );
    }
  }

  @override
  void initState(){
    super.initState();
    delay();
    getDataItemsFromJson();
    getDataUsersFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Wait loading data..."),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }


//  refactor to stateless wigets
/*
  Widget _buildList() {
    return new ListView.builder(
      itemCount: data == null ? 0 : data.length,
      cacheExtent: 100,
      itemBuilder: (BuildContext context, int index){
        return new Card(
           child: Text(data[index]["title"]),
        );
      }
    );
  }
*/

}
