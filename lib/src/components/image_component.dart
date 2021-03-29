import 'package:flutter/material.dart';

import 'package:lab_poc/src/models/card_model.dart';

class ImageComponent extends StatelessWidget {
  final CardModel card;

  const ImageComponent({
    key,
    this.card,
    BoxFit fit = BoxFit.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: AssetImage('assets/images/default_card.jpg'),
      image: card.imageIsEmpty()
          ? AssetImage('assets/images/default_card.jpg')
          : NetworkImage(card?.imageUrl ?? ''),
      fit: BoxFit.fill,
      fadeInDuration: const Duration(milliseconds: 300),
    );
  }
}
