import 'package:flutter/material.dart';
import 'package:lab_poc/src/models/card_list_model.dart';
import 'package:lab_poc/src/models/card_model.dart';
import 'package:provider/provider.dart';

class BackComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardListModel>(
      builder: (_, cards, __) => Container(
        decoration: _backgroundImage(),
        child: _infoList(cards.selected),
      ),
    );
  }

  BoxDecoration _backgroundImage() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/card_background.jpg"),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(width: 17.0, color: Colors.black),
    );
  }

  ListView _infoList(CardModel card) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      children: [
        ListTile(
          title: Text('Name'),
          subtitle: Text(card.name),
        ),
        ListTile(
          title: Text('Type'),
          subtitle: Text(card.type),
        ),
        ListTile(
          title: Text('Rarity'),
          subtitle: Text(card.rarity),
        ),
        ListTile(
          title: Text('Power'),
          subtitle: Text(card.power),
        ),
        ListTile(
          title: Text('Toughness'),
          subtitle: Text(card.toughness),
        ),
        ListTile(
          title: Text('Id'),
          subtitle: Text(card.id),
        ),
      ],
    );
  }
}
