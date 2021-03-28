import 'package:dio/dio.dart';
import 'package:lab_poc/src/models/card_model.dart';

class CardRepository {
  Dio dio;
  final url = 'https://api.magicthegathering.io/v1/cards';

  CardRepository([Dio client]) : dio = client ?? Dio();

  Future<List<CardModel>> fetch({int page = 1, int pageSize = 25}) async {
    Response response = await dio.get(
      url,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
      },
    );

    if (response.statusCode != 200) return <CardModel>[];

    final cards = <CardModel>[];
    for (var card in response.data['cards']) {
      cards.add(CardModel.fromJson(card as Map<String, dynamic>));
    }
    return cards;
  }
}
