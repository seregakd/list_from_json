import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class GetData extends StatefulWidget {
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  List dataItems;
  List dataUsers;
//  Map <String, String> mapItems;
//  Map <String, String> mapUsers;
//  refactor to stateless wigets

  void getDataItemsFromJson() async {
    dataItems = json.decode(await rootBundle.loadString('assets/DataItems.json'));
    waitData();
  }

  void getDataUsersFromJson() async {
    dataUsers = json.decode(await rootBundle.loadString('assets/DataUsers.json'));
    waitData();
  }

  void waitData() {
    if (dataItems != null && dataUsers != null) {
      print ("dataItems" + dataItems.toString());
      print ("dataUsers" + dataUsers.toString());
      Navigator.pushReplacementNamed(context, '/login',
          arguments: <String, List> {'dataItems': dataItems}
      );
//dataItems, dataUsers
    }
  }

  @override
  void initState(){
    getDataItemsFromJson();
    getDataUsersFromJson();
  }

  @override
  Widget build(BuildContext context) {
//    return ProgressDialog();

    return Scaffold(
      appBar: AppBar(
          title: Text("Wait loading data..."),
      ),
    );
  }

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
