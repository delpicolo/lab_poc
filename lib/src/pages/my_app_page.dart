import 'package:flutter/material.dart';
import 'details_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab POC',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
      },
    );
  }
}
