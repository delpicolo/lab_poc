import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lab_poc/src/components/card/list_component.dart';
import 'package:lab_poc/src/components/drawer/menu_component.dart';
import 'package:lab_poc/src/models/card_list_model.dart';
import 'package:lab_poc/src/repositories/card_repository.dart';

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
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('List of Cards'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_outlined),
            onPressed: () {
              cardList.reset();
              page = 1;
              _fetch();
            },
          ),
        ],
      ),
      drawer: MenuComponent(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListCardsComponent(
          scrollController: _scrollController,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    cardList = Provider.of<CardListModel>(context, listen: false);
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
