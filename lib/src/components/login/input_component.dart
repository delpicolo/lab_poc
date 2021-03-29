import 'package:flutter/material.dart';

class InputComponent extends StatefulWidget {
  @override
  _InputComponentState createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 20,
          bottom: 12,
        ),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                email = text;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10), // Gambs
            TextField(
              onChanged: (text) {
                password = text;
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10), // Gambs
            ElevatedButton(
              //color: Colors.cyan,
              onPressed: () {
                _validateAccess();
              },
              child: Text('Entrar'),
            )
          ],
        ),
      ),
    );
  }

  _validateAccess() {
    if (email != 'teste' || password != 'teste') {
      print('Deu ruim !!!');
      return;
    }
    print('Show !!!');
    Navigator.of(context).pushReplacementNamed('/home');
  }
}
