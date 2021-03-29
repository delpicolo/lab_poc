import 'package:flutter/material.dart';
import 'package:lab_poc/src/components/card/flip_component.dart';

class CardComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 20,
        bottom: 20,
      ),
      child: Card(
        elevation: 0.0,
        child: FlipComponent(),
      ),
    );
  }
}
