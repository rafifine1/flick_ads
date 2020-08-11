class Ads {
  final List<String> ads;

  Ads({this.ads});

  factory Ads.fromJson(List<dynamic> json) {
    return Ads(
      ads: json != null ? new List<String>.from(json) : null,
    );
  }

  List<dynamic> toJson() {
    List<dynamic> data = new List<String>();
    if (this.ads != null) {
      data = this.ads;
    }
    return data;
  }
}
