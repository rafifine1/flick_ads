import 'package:flick_ads/networking/ApiProvider.dart';
import 'dart:async';
import 'package:flick_ads/Models/Categories.dart';

class CategoryRepo {
  ApiProvider _provider = ApiProvider();

  Future<Categories> fetchCategoriesData() async {
    final response = await _provider.get("categories");
    return Categories.fromJson(response);
  }
}
