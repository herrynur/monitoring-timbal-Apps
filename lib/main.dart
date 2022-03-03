import 'package:flutter/material.dart';
import 'package:monitoring_timbal/home.dart';
import 'package:monitoring_timbal/history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
       History.routeName: (context) => History(ModalRoute.of(context)?.settings.arguments as String),
      },
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}