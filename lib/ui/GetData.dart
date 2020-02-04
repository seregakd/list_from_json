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

  void getDataItemsFromJson() async {
    List dataItems = json.decode(await rootBundle.loadString('assets/DataItems.json'));
    String js = await rootBundle.loadString('assets/DataItems.json');
    print("js" + js);
    print("dataItems=" + dataItems.toString());
    parceDataItems(dataItems);
//    itemsMap = json.decode(await rootBundle.loadString('assets/DataItems.json'));
    waitData();
  }

  void getDataUsersFromJson() async {
    List dataUsers = json.decode(await rootBundle.loadString('assets/DataUsers.json'));
    parceDataUsers(dataUsers);
//    String dataUsers = await rootBundle.loadString('assets/DataUsers.json');
//    usersMap = json.decode(dataUsers);
    waitData();
  }

  void parceDataItems(List dataItems) {
//    print("dataItems=" + dataItems.toString());
    for (dynamic item in dataItems) {
      itemsMap[item["title"]] = item["body"];
    }
  }

  void parceDataUsers(List dataUsers) {
    for (dynamic item in dataUsers) {
      usersMap[item["user"]] = item["password"];
    }
  }

  void waitData() {

    if (itemsMap != null && usersMap != null) {
      Navigator.pushReplacementNamed(context, '/login',
          arguments: DataFromJson(itemsMap, usersMap),
      );
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
