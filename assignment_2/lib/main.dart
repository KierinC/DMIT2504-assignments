//Do not change this file in any way.

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:assignment_2/themes/theme.dart';
import 'package:assignment_2/first-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App2',
      debugShowCheckedModeBanner: false,
      home: MyFirstPage(),
      theme: buildTheme(),
    );
  }
}
