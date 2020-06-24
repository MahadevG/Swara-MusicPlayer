import 'package:flutter/material.dart';
import 'package:swara/pages/list_page.dart';

/// https://www.youtube.com/watch?v=ABZKH8iUOmQ
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Some Geeta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage(),
    );
  }
}
