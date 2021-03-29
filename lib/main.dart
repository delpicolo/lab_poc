import 'package:flutter/material.dart';
import 'package:lab_poc/src/models/card_list_model.dart';
import 'package:lab_poc/src/pages/my_app_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => CardListModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: MyApp(),
        ),
      ),
    );
