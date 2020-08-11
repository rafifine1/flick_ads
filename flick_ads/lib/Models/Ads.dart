class Ads {
  final List<String> ads;

  Ads({this.ads});

  factory Ads.fromJson(List<String> json) {
    return Ads(
      ads: json != null ? new List<String>.from(json) : null,
    );
  }

  List<String> toJson() {
    List<String> data = new List<String>();
    if (this.ads != null) {
      data = this.ads;
    }
    return data;
  }
}
