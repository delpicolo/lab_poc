import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lab_poc/src/components/menu_component.dart';
import 'package:lab_poc/src/models/card_list_model.dart';
import 'package:lab_poc/src/repositories/card_repository.dart';

import 'details_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CardRepository _repository = new CardRepository();
  final ScrollController _scrollController = new ScrollController();
  CardListModel cardList = CardListModel();
  int page = 1;

  @override
  Widget build(BuildContext context) {
    this.cardList = Provider.of<CardListModel>(context, listen: false);
    _fetch();

    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Flutter Lab POC'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: MenuComponent(),
      body: Consumer<CardListModel>(
        builder: (_, cards, __) => Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: cards.items.length,
            itemBuilder: (context, index) {
              var card = cards.items[index];
              return ListTile(
                leading: card.imageUrl != ''
                    ? Image.network(
                        card.imageUrl,
                        loadingBuilder: (context, child, progress) {
                          return progress == null
                              ? child
                              : CircularProgressIndicator(
                                  strokeWidth: 5,
                                );
                        },
                      )
                    : Image.asset('assets/images/default.jpg'),
                title: Text(card.name),
                trailing: Icon(Icons.info_rounded),
                // onTap: () => Navigator.pushNamed(context, '/details', arguments: card),
                onTap: () {
                  cardList.select(card.id);
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => DetailsPage(),
                  //   ),
                  // );
                },
              );
            },
            addAutomaticKeepAlives: false,
            dragStartBehavior: DragStartBehavior.down,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetch();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetch();
      }
    });
  }

  void disposed() {
    _scrollController.dispose();
    super.dispose();
  }

  _fetch() async {
    final result = await _repository.fetch(page: page);
    cardList.load(result.items);
    page++;
    print(cardList.items.length);
  }
}
