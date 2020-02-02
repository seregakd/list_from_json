import 'package:flutter/material.dart';

import 'ui/GetData.dart';
import 'ui/LoginPage.dart';
import 'ui/ViewList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List from JSON',
      initialRoute: '/',
      routes: {
        '/':(context) => GetData(),
        '/login':(context) => LoginPage(),
        '/list':(context) => ViewList(),
      },
    );
  }
}

