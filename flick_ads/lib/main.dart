import 'package:flick_ads/Views/MainView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: 'Flick Ads',
      home: MainView(),
    );
  }
}
