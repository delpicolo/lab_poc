import 'package:flutter/foundation.dart';
import 'card_model.dart';

class CardListModel with ChangeNotifier {
  List<CardModel> items = <CardModel>[];
  CardModel selected;
  int page = 1;

  void load(List<CardModel> items) {
    this.items += items;
    page++;
    notifyListeners();
  }

  void select(String id) {
    selected = items.where((item) => item.id == id).first;
    notifyListeners();
  }
}
