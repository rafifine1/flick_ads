import 'package:flutter/material.dart';
import 'package:flick_ads/Blocs/AdsBloc.dart';
import 'package:flick_ads/Networking/Response.dart';
import 'package:flick_ads/Models/Ads.dart';
import 'package:flick_ads/Views/AdView.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AdsView extends StatefulWidget {
  @override
  _AdsState createState() => _AdsState();
}

class _AdsState extends State<AdsView> {
  AdsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AdsBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ads', style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: Color(0xFF333333),
      ),
      backgroundColor: Color(0xFF333333),
      body: RefreshIndicator(
        onRefresh: () => _bloc.fetchAds(),
        child: StreamBuilder<Response<Ads>>(
          stream: _bloc.adsListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return Loading(loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                  return AdsList(adsList: snapshot.data.data);
                  break;
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.fetchAds(),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

class AdsList extends StatelessWidget {
  final Ads adsList;

  const AdsList({Key key, this.adsList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF202020),
      body: ListView.builder(
        itemBuilder: getCatItemUI,
        itemCount: adsList.ads.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
      ),
    );
  }

  Widget getCatItemUI(BuildContext context, int index) {
    return new Card(
        child: new Column(
      children: <Widget>[
        new ListTile(
          leading: CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
            // imageUrl: adsList.ads[index]['image'],
            imageUrl: "http://via.placeholder.com/350x150",
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          title: new Text(
            adsList.ads[index]['name'],
            style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          subtitle: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(adsList.ads[index]['price'],
                    style: new TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.normal))
              ]),
          //trailing: ,
          onTap: () {
            // _showSnackBar(context, _allCities[index]);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AdView(adsList.ads[index]['id'])));
          },
        )
      ],
    ));
  }

  Future navigateToCategories(context) async {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => AdView(adsList.ads[index])));
  }
}

class Error extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const Error({Key key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          RaisedButton(
            color: Colors.white,
            child: Text('Retry', style: TextStyle(color: Colors.black)),
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}

class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }
}
