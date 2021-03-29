import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lab_poc/src/components/image_component.dart';
import 'package:lab_poc/src/models/card_list_model.dart';
import 'package:lab_poc/src/models/card_model.dart';
import 'package:provider/provider.dart';

class ListCardsComponent extends StatelessWidget {
  final ScrollController scrollController;

  ListCardsComponent({
    Key key,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CardListModel>(
      builder: (_, cards, __) => ListView.builder(
        controller: scrollController,
        itemCount: cards.items.length,
        itemBuilder: (context, index) {
          var card = cards.items[index];
          return ListTile(
            leading: ImageComponent(card: card),
            title: Text(card.name),
            trailing: Icon(Icons.info_rounded),
            onTap: () => _select(context, cards, card),
          );
        },
        addAutomaticKeepAlives: false,
        dragStartBehavior: DragStartBehavior.down,
      ),
    );
  }

  _select(context, CardListModel cards, CardModel card) {
    cards.select(card.id);
    Navigator.pushNamed(context, '/details');
  }
}
