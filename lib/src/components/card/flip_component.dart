import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:lab_poc/src/components/card/back_component.dart';
import 'package:lab_poc/src/components/card/front_component.dart';

class FlipComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      speed: 700,
      onFlipDone: (status) {
        print(status);
      },
      front: FrontComponent(),
      back: BackComponent(),
    );
  }
}
