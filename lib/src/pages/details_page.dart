import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lab_poc/src/models/card_model.dart';

class DetailsPage extends StatelessWidget {
  final CardModel card;

  DetailsPage({Key key, this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Flutter Lab POC'),
      ),
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: _content(context),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        'Touch the card to see more info.',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.touch_app,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _content(context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 20,
        bottom: 20,
      ),
      child: Card(
        elevation: 0.0,
        child: _flip(context),
      ),
    );
  }

  _flip(context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      speed: 1000,
      onFlipDone: (status) {
        print(status);
      },
      front: _front(context),
      back: _back(context),
    );
  }

  _front(context) {
    return Container(
      child: card.imageUrl != ''
          ? Image.network(
              card.imageUrl,
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? child
                    : CircularProgressIndicator(
                        strokeWidth: 5,
                      );
              },
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
            )
          : Image.asset('assets/images/default.jpg'),
    );
  }

  _back(context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/fundo2.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 17.0, color: Colors.black),
      ),
      child: ListView(
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
            title: Text('Printings'),
            subtitle: Text(card.printings.toString()),
          ),
          ListTile(
            title: Text('Id'),
            subtitle: Text(card.id),
          ),
        ],
      ),
    );
  }
}
