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

// class Categories {
//   String id;
//   String createdAt;
//   String name;
//   String image;

//   Categories({this.id, this.createdAt, this.name, this.image});

//   Categories.fromJson(Map<String, dynamic> json) {
//     id = json['id'].cast<String>();
//     createdAt = json['createdAt'];
//     name = json['name'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['createdAt'] = this.createdAt;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     return data;
//   }
// }
