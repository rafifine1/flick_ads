import 'package:flick_ads/Views/CategoriesView.dart';
import 'package:flick_ads/Views/SubPage.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Go to Categories'),
              onPressed: () {
                navigateToSubPage(context);
                print("Button pressed");
              },
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Go to Ads'),
              onPressed: () {
                navigateToSubPage(context);
                print("Button pressed");
              },
            )
          ],
        ),
      ),
    );
  }

  Future navigateToSubPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CategoriesView()));
  }
}
