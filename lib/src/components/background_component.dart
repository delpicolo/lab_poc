import 'package:flutter/material.dart';

class BackgroundComponent extends StatelessWidget {
  final String assetImage;

  BackgroundComponent({Key key, this.assetImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        assetImage, // 'assets/images/login_background.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
