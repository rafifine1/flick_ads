import 'dart:async';

import 'package:flick_ads/Networking/Response.dart';
import 'package:flick_ads/Repositories/CategoriesRepo.dart';
import 'package:flick_ads/Models/Categories.dart';

class CategoryBloc {
  CategoryRepo _categoryRepository;
  StreamController _categoryListController;

  StreamSink<Response<Categories>> get categoryListSink =>
      _categoryListController.sink;

  Stream<Response<Categories>> get categoryListStream =>
      _categoryListController.stream;

  CategoryBloc() {
    _categoryListController = StreamController<Response<Categories>>();
    _categoryRepository = CategoryRepo();
    fetchCategories();
  }

  fetchCategories() async {
    categoryListSink.add(Response.loading('Getting Categories.'));
    try {
      print('working 1');
      Categories cats = await _categoryRepository.fetchCategoriesData();
      print('working 2');
      categoryListSink.add(Response.completed(cats));
      print('working 3');
    } catch (e) {
      categoryListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _categoryListController?.close();
  }
}
