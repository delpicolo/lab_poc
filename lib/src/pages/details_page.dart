import 'package:flutter/material.dart';
import 'package:lab_poc/src/components/card/card_component.dart';
import 'package:lab_poc/src/components/card/info_component.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Card Details'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 8, child: CardComponent()),
          Expanded(flex: 1, child: InfoComponent()),
        ],
      ),
    );
  }
}
