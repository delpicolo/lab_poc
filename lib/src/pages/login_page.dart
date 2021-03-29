import 'package:flutter/material.dart';
import 'package:lab_poc/src/components/background_component.dart';
import 'package:lab_poc/src/components/login/login_component.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundComponent(assetImage: 'assets/images/login_background.png'),
          Container(color: Colors.black.withOpacity(0.3)),
          LoginComponent(),
        ],
      ),
    );
  }
}
