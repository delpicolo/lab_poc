import 'package:flutter/material.dart';
import 'package:lab_poc/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab POC',
      theme: ThemeData(primarySwatch: Colors.cyan),
      initialRoute: '/',
      routes: routes,
    );
  }
}
