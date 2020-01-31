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

  void getDataItemsFromJson() async {
//    setState(() {
//    String dataJson = await rootBundle.loadString('assets/DataItems.json');
//    print ("dataItems" + dataJson);

    dataItems = json.decode(await rootBundle.loadString('assets/DataItems.json'));
//    print ("dataItems" + dataItems.toString());
//    });
    waitData();
  }

  void getDataUsersFromJson() async {
//    return json.decode(await rootBundle.loadString('assets/DataUsers.json'));
//    setState(() {
    dataUsers = json.decode(await rootBundle.loadString('assets/DataUsers.json'));
//    print ("dataUsers" + dataUsers.toString());
//    });
    waitData();
  }

  void waitData() {
    if (dataItems != null && dataUsers != null) {
      //     setState(() {});
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
//    return Text("Wait loading data...");
    return Scaffold(
      body: Text("Wait loading data..."),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("List")
      ),
      body: LoginPage(dataItems, dataUsers),
    );
  }

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
