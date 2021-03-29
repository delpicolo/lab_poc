import 'package:flutter/material.dart';
import 'package:lab_poc/src/pages/details_page.dart';
import 'package:lab_poc/src/pages/home_page.dart';
import 'package:lab_poc/src/pages/login_page.dart';

var routes = <String, WidgetBuilder>{
  '/': (context) => LoginPage(),
  '/home': (context) => HomePage(),
  '/details': (context) => DetailsPage(),
};
