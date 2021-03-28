import 'package:dio/dio.dart';
import 'package:lab_poc/src/models/card_list_model.dart';
import 'package:lab_poc/src/models/card_model.dart';

class CardRepository {
  Dio dio;
  final url = 'https://api.magicthegathering.io/v1/cards';

  CardRepository([Dio client]) : dio = client ?? Dio();

  Future<CardListModel> fetch({int page = 1, int pageSize = 25}) async {
    Response response = await dio.get(
      url,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
      },
    );

    if (response.statusCode != 200) return CardListModel();

    final CardListModel cardList = CardListModel();
    for (var card in response.data['cards']) {
      cardList.items.add(CardModel.fromJson(card as Map<String, dynamic>));
    }

    return cardList;
  }
}
