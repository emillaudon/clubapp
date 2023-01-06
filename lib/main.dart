import 'package:flutter/material.dart';
import 'views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFFFF3E3E),
        bottomAppBarColor: const Color(0xFFFF4155),
        scaffoldBackgroundColor: const Color(0xFFFF3E3E),
        buttonTheme: const ButtonThemeData(buttonColor: Color(0xFFFFB1B1))
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


/*
mailto: info@example.com?
subject=Issue%20with%20your
%20product&body=Body%20goes%20here
*/