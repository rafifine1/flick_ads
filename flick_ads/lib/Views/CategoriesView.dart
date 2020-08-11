import 'package:flutter/material.dart';
import 'package:flick_ads/Blocs/CategoriesBloc.dart';
import 'package:flick_ads/Networking/Response.dart';
import 'package:flick_ads/Models/Categories.dart';

class CategoriesView extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesView> {
  CategoryBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CategoryBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text('Categories',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: Color(0xFF333333),
      ),
      backgroundColor: Color(0xFF333333),
      body: RefreshIndicator(
        onRefresh: () => _bloc.fetchCategories(),
        child: StreamBuilder<Response<Categories>>(
          stream: _bloc.categoryListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return Loading(loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                  return CategoryList(categoryList: snapshot.data.data);
                  break;
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.fetchCategories(),
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

class CategoryList extends StatelessWidget {
  final Categories categoryList;

  const CategoryList({Key key, this.categoryList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF202020),
      body: ListView.builder(
        itemBuilder: getCatItemUI,
        itemCount: categoryList.categories.length,
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
          leading: new Image.network(
            categoryList.categories[index]['image'],
            fit: BoxFit.cover,
            width: 100.0,
          ),

          title: new Text(
            categoryList.categories[index]['name'],
            style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          subtitle: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(categoryList.categories[index]['createdAt'],
                    style: new TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.normal))
              ]),
          //trailing: ,
          onTap: () {
            // _showSnackBar(context, _allCities[index]);
          },
        )
      ],
    ));
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
