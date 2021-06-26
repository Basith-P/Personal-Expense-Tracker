import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Text('Trackr'),
          )
        ],
      ),
    ));
  }
}
