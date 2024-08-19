import 'package:flutter/material.dart';
import 'package:flutter_my_launcher/config.dart';
import 'package:flutter_my_launcher/dashBoard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          )),
      home: const DashboardPage(),
    );
  }
}
