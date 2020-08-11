import 'package:flick_ads/networking/ApiProvider.dart';
import 'dart:async';
import 'package:flick_ads/Models/Ad.dart';

class AdRepo {
  ApiProvider _provider = ApiProvider();

  Future<Ad> fetchAdData(String ad) async {
    final response = await _provider.get("ads/" + ad);
    return Ad.fromJson(response);
  }
}
