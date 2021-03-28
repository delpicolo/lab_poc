import 'package:flutter_test/flutter_test.dart';
import 'package:lab_poc/src/controllers/home_controller.dart';
import 'package:lab_poc/src/enums/home_state_enum.dart';
import 'package:lab_poc/src/models/card_model.dart';
import 'package:lab_poc/src/repositories/card_repository.dart';
import 'package:mockito/mockito.dart';

class CardRepositoryMock extends Mock implements CardRepository {}

main() {
  final repository = CardRepositoryMock();
  final controller = HomeController(repository);
  setUp(() {});
  test('should get all cards', () async {
    when(repository.fetch()).thenAnswer((_) async => [CardModel()]);
    expect(controller.state.value, HomeState.start);
    await controller.start();
    expect(controller.state.value, HomeState.success);
    expect(controller.cards.isNotEmpty, true);
  });
}
