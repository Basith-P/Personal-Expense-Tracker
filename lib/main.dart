import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
