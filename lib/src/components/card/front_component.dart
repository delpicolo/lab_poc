import 'package:flutter/material.dart';
import 'package:lab_poc/src/components/image_component.dart';
import 'package:lab_poc/src/models/card_list_model.dart';
import 'package:provider/provider.dart';

class FrontComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardListModel>(
      builder: (_, cards, __) => ImageComponent(card: cards.selected),
    );
  }
}
