import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // _background(),
          Container(color: Colors.black.withOpacity(0.3)),
          _body(),
        ],
      ),
    );
  }

  Widget _background() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/images/background.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // _logo(),
              _input(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      width: 250,
      height: 250,
      child: Image.asset('assets/images/login-logo.png'),
    );
  }

  Widget _input() {
    return Card(
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
            RaisedButton(
              color: Colors.cyan,
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
