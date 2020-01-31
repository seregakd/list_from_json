import 'package:flutter/material.dart';
import 'ListWithChekbox.dart';

class ViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: _buildTitle(context)
      ),
      body: ListWithChekbox(),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return RaisedButton(
      onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
      child: Text('Login selection'),
    );
  }
}