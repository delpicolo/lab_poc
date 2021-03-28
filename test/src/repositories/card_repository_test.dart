import 'package:flutter_test/flutter_test.dart';
import 'package:lab_poc/src/models/card_model.dart';
import 'package:lab_poc/src/repositories/card_repository.dart';
import 'package:mockito/mockito.dart';

class CardRepositoryMock extends Mock implements CardRepository {}

main() {
  final repository = CardRepositoryMock();
  test('Should return a list', () async {
    when(repository.fetch()).thenAnswer((_) async => [CardModel()]);
    final cards = await repository.fetch();
    expect(cards.isNotEmpty, true);
  });
}
