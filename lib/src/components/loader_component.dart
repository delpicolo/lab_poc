import 'package:flutter/material.dart';

class LoaderComponent extends StatelessWidget {
  final Colors backgroundColor;

  LoaderComponent({Key key, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CircularProgressIndicator()),
      decoration: BoxDecoration(color: backgroundColor ?? Colors.white),
    );
  }
}
