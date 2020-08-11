import 'package:flick_ads/networking/ApiProvider.dart';
import 'dart:async';
import 'package:flick_ads/Models/Ads.dart';

class AdsRepo {
  ApiProvider _provider = ApiProvider();

  Future<Ads> fetchAdsData() async {
    final response = await _provider.get("ads");
    return Ads.fromJson(response);
  }
}
