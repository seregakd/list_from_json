import 'package:flutter/material.dart';
import 'package:list_from_json/model/DataFromJson.dart';
import 'ListWithChekbox.dart';

class ViewList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DataFromJson dataFromJson = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
          title: _buildTitle(context, dataFromJson)
      ),
      body: ListWithChekbox(dataFromJson.itemsList),
    );
  }

  Widget _buildTitle(BuildContext context, DataFromJson dataFromJson) {
    return RaisedButton(
      onPressed: () => Navigator.pushReplacementNamed(context, '/login',
      arguments: dataFromJson),
      child: Text('Login selection'),
    );
  }
}