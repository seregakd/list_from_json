import 'package:flutter/material.dart';
import '../Services.dart';

import 'package:list_from_json/model/DataFromJson.dart';

class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  DataFromJson dataFromJson;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dataFromJson = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextFields(),
            RaisedButton(
              child: Text('Login'),
              onPressed: _loginPressed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return AppBar(
      title: Text("List with login"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  void _loginPressed () {
    if (!dataFromJson.usersMap.containsKey(_emailController.text)) {
      return viewShowDialog(context, 'Username not exists');
    }

    if (dataFromJson.usersMap[_emailController.text] != _passwordController.text) {
      return viewShowDialog(context, 'Password does not match');
    }

    Navigator.pushReplacementNamed(context, '/list',
      arguments: dataFromJson);
  }
}