// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'error_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding .ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "List Scrolling Error Sample",
      home: Scaffold(
        body: ErrorPage(),
      ),
    );
  }

}