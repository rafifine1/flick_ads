class Ad {
  String id;
  String createdAt;
  String name;
  String image;
  String price;

  Ad({this.id, this.createdAt, this.name, this.image, this.price});

  Ad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    return data;
  }
}
