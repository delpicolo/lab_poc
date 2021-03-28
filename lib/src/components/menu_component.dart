import 'package:flutter/material.dart';
import 'package:lab_poc/src/components/profile_component.dart';

class MenuComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ProfileComponent(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            subtitle: Text('tela de início'),
            onTap: () {
              print('home');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Logout'),
            subtitle: Text('finalizar sessão'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
              print('saiu');
            },
          )
        ],
      ),
    );
  }
}
