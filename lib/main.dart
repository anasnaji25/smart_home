import 'package:flutter/material.dart';
import 'package:smart_home/Pages/home_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Home',
      theme: ThemeData(
        primaryColor: Colors.blue[800]
      ),
      home: HomePage(),
    );
  }
}
