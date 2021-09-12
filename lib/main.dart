
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/Pages/home_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392.72,834.90),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart Home',
          theme: ThemeData(
            primaryColor: Colors.blue[800]
          ),
          home: HomePage(),
        );
      }
    );
  }
}
