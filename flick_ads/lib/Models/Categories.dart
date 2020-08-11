import 'package:flick_ads/Models/Category.dart';

class Categories {
  final List<dynamic> categories;

  Categories({this.categories});

  factory Categories.fromJson(List<dynamic> json) {
    return Categories(
      categories: json != null ? new List<dynamic>.from(json) : null,
    );
  }

  List<dynamic> toJson() {
    List<Category> data = new List<Category>();
    if (this.categories != null) {
      data = this.categories;
    }
    return data;
  }
}
