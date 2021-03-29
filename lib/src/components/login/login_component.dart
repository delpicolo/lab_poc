import 'package:flutter/material.dart';
import 'package:lab_poc/src/components/login/input_component.dart';

class LoginComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
