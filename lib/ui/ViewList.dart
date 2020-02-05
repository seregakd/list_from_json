import 'package:flutter/material.dart';
import 'package:list_from_json/model/DataFromJson.dart';
import 'ListWithChekbox.dart';

class ViewList extends StatelessWidget {
  DataFromJson dataFromJson;

  @override
  Widget build(BuildContext context) {
    dataFromJson = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
          title: _buildTitle(context)
      ),
      body: ListWithChekbox(dataFromJson.itemsMap),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return RaisedButton(
      onPressed: () => Navigator.pushReplacementNamed(context, '/login',
      arguments: dataFromJson),
      child: Text('Login selection'),
    );
  }
}