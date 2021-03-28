import 'package:flutter/material.dart';
import 'package:lab_poc/src/models/card_list_model.dart';
import 'package:lab_poc/src/pages/details_page.dart';
import 'package:provider/provider.dart';
// import 'details_page.dart';
import 'home_page.dart';
import 'login_page.dart';
// import 'login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab POC',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ChangeNotifierProvider<CardListModel>(
        create: (context) => CardListModel(),
        child: HomePage(),
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => LoginPage(),
      //   '/home': (context) => ChangeNotifierProvider<CardListModel>(
      //         create: (context) => CardListModel(),
      //         child: HomePage(),
      //       ),
      //   '/details': (context) => ChangeNotifierProvider<CardListModel>(
      //         create: (context) => CardListModel(),
      //         child: DetailsPage(),
      //       ),
      // },
    );
  }
}
