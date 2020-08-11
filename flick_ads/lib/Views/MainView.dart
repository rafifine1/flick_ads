import 'package:flick_ads/Views/AdsView.dart';
import 'package:flick_ads/Views/CategoriesView.dart';
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
                navigateToCategories(context);
                print("Button pressed");
              },
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Go to Ads'),
              onPressed: () {
                navigateToAds(context);
                print("Button pressed");
              },
            )
          ],
        ),
      ),
    );
  }

  Future navigateToCategories(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CategoriesView()));
  }

  Future navigateToAds(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AdsView()));
  }
}
