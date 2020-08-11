import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

List<String> litems = [
  "One",
  "Two",
  "Three",
  "Four",
  "Five",
  "Six",
  "Seven",
  "Eight",
  "Nine",
  "Ten"
];

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: 'Flick Ads',
      home: new ListDisplay(),
    );
  }
}

class ListDisplay extends StatefulWidget {
  @override
  State createState() => new DynamicList();
}

class DynamicList extends State<ListDisplay> {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Flick Ads"),
        ),
        body: new ListView.builder(
          itemCount: litems.length,
          itemBuilder: (BuildContext ctxt, int index) => buildBody(ctxt, index),
        ));
  }

  // A Separate Function called from itemBuilder
  Widget buildBody(BuildContext ctxt, int index) {
    return new Text(litems[index]);
  }
}
