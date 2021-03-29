import 'package:flutter/material.dart';
import 'package:lab_poc/src/components/drawer/profile_component.dart';

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
            subtitle: Text('Go to list of cards'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
              print('Home');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Logout'),
            subtitle: Text('End the session started'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
              print('Logged out');
            },
          )
        ],
      ),
    );
  }
}
