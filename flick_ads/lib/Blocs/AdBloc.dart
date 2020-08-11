import 'dart:async';

import 'package:flick_ads/Networking/Response.dart';
import 'package:flick_ads/Repositories/AdRepo.dart';
import 'package:flick_ads/Models/Ad.dart';

class AdBloc {
  AdRepo _adRepository;
  StreamController _adListController;

  StreamSink<Response<Ad>> get adListSink => _adListController.sink;

  Stream<Response<Ad>> get adListStream => _adListController.stream;

  AdBloc(String ad) {
    _adListController = StreamController<Response<Ad>>();
    _adRepository = AdRepo();
    fetchAd(ad);
  }

  fetchAd(String ad) async {
    adListSink.add(Response.loading('Getting Ad.'));
    try {
      Ad adSingle = await _adRepository.fetchAdData(ad);
      adListSink.add(Response.completed(adSingle));
    } catch (e) {
      adListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _adListController?.close();
  }
}
