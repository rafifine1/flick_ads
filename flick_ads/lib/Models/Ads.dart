import 'package:flick_ads/Models/Ad.dart';

class Ads {
  final List<dynamic> ads;

  Ads({this.ads});

  factory Ads.fromJson(List<dynamic> json) {
    return Ads(
      ads: json != null ? new List<dynamic>.from(json) : null,
    );
  }

  List<dynamic> toJson() {
    List<Ad> data = new List<Ad>();
    if (this.ads != null) {
      data = this.ads;
    }
    return data;
  }
}
