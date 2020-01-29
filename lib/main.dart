import 'package:flutter/material.dart';

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
//        itemCount: models.length,
//        itemBuilder: (BuildContext context, int index){
 //         return ItemList(itemModel: models[i], listItemNumber: i,
 //             parentCount: refreshCount, parentCb: refreshCheckbox);
 //       }
    );
  }
}
