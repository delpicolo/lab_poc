import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lab_poc/src/models/card_model.dart';
import 'package:lab_poc/src/repositories/card_repository.dart';

import 'details_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CardModel> cards = <CardModel>[];
  CardRepository _repository = new CardRepository();
  ScrollController _scrollController = new ScrollController();
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Flutter Lab POC'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_outlined),
            onPressed: () {
              setState(() {
                cards = <CardModel>[];
                page = 1;
                print(cards.length);
              });
              _fetch();
            },
          ),
        ],
      ),
      drawer: _menu(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: cards.length,
          itemBuilder: (context, index) {
            var card = cards[index];
            return _item(context, card);
          },
          addAutomaticKeepAlives: false,
          dragStartBehavior: DragStartBehavior.down,
        ),
      ),
    );
  }

  Widget _menu(context) {
    return Drawer(
      child: Column(
        children: [
          _profile(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            subtitle: Text('tela de início'),
            onTap: () {
              print('home');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Logout'),
            subtitle: Text('finalizar sessão'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
              print('saiu');
            },
          )
        ],
      ),
    );
  }

  Widget _profile() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.network(
            'https://miro.medium.com/max/360/0*1SkS3mSorArvY9kS.jpg'),
      ),
      accountName: Text('Alexandre Picolo'),
      accountEmail: Text('alexandre.picolo@gmail.com'),
    );
  }

  _item(BuildContext context, CardModel card) {
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(card: card),
          ),
        );
      },
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
    setState(() {
      cards += result;
      page++;
      print(cards.length);
    });
  }
}
