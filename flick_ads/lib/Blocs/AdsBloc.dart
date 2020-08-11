import 'dart:async';

import 'package:flick_ads/Networking/Response.dart';
import 'package:flick_ads/Repositories/AdsRepo.dart';
import 'package:flick_ads/Models/Ads.dart';

class AdsBloc {
  AdsRepo _adsRepository;
  StreamController _adsListController;

  StreamSink<Response<Ads>> get adsListSink => _adsListController.sink;

  Stream<Response<Ads>> get adsListStream => _adsListController.stream;

  AdsBloc() {
    _adsListController = StreamController<Response<Ads>>();
    _adsRepository = AdsRepo();
    fetchAds();
  }

  fetchAds() async {
    adsListSink.add(Response.loading('Getting Ads.'));
    try {
      Ads ads = await _adsRepository.fetchAdsData();
      adsListSink.add(Response.completed(ads));
    } catch (e) {
      adsListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _adsListController?.close();
  }
}
