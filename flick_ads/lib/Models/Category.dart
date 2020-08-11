class Categories {
  String id;
  String createdAt;
  String name;
  String image;

  Categories({this.id, this.createdAt, this.name, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
