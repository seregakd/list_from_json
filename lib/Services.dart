import 'package:flutter/material.dart';

  void viewShowDialog(BuildContext context, String errorMessage){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: ListTile(
          title: Text("Error!"),
          subtitle: Text(errorMessage),
        ),
        actions: <Widget>[
          FlatButton(
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
