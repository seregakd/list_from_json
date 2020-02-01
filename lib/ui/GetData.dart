import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class GetData extends StatefulWidget {
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  Map <String, String> itemsMap = Map<String, String>();
  Map <String, String> usersMap = Map<String, String>();

  void getDataItemsFromJson() async {
    List dataItems = json.decode(await rootBundle.loadString('assets/DataItems.json'));
    parceDataItems(dataItems);
    waitData();
  }

  void getDataUsersFromJson() async {
    List dataUsers = json.decode(await rootBundle.loadString('assets/DataUsers.json'));
    parceDataUsers(dataUsers);
    waitData();
  }

  void parceDataItems(List dataItems) {
    for (dynamic item in dataItems) {
      itemsMap[item["title"]] = item["body"];
//      print ("title=" + item["title"] + " body=" + item["body"]);
//      print("itemsMap=" + itemsMap[item["title"]]);
    }
  }

  void parceDataUsers(List dataUsers) {
    for (dynamic item in dataUsers) {
      usersMap[item["user"]] = item["password"];
//      print ("user=" + item["user"] + " password=" + item["password"]);
    }
  }

  void waitData() {

    if (itemsMap != null && usersMap != null) {
//      print ("itemsMap" + itemsMap.toString());

//      print ("usersMap" + usersMap.toString());
      Navigator.pushReplacementNamed(context, '/login',
//          arguments: <String, List> {'dataItems': dataItems}
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
