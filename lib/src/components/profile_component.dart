import 'package:flutter/material.dart';

class ProfileComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      currentAccountPicture: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.network(
            'https://miro.medium.com/max/360/0*1SkS3mSorArvY9kS.jpg'),
      ),
      accountName: Text('Alexandre Picolo'),
      accountEmail: Text('alexandre.picolo@gmail.com'),
    );
  }
}
