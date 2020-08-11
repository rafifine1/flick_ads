import 'dart:async';

import 'package:flick_ads/Networking/Response.dart';
import 'package:flick_ads/Repositories/AdRepo.dart';
import 'package:flick_ads/Models/Ad.dart';

class AdBloc {
  AdRepo _adRepository;
  StreamController _adController;

  StreamSink<Response<Ad>> get adSink => _adController.sink;

  Stream<Response<Ad>> get adStream => _adController.stream;

  AdBloc(String ad) {
    _adController = StreamController<Response<Ad>>();
    _adRepository = AdRepo();
    fetchAd(ad);
  }

  fetchAd(String ad) async {
    adSink.add(Response.loading('Getting Ad.'));
    try {
      Ad adSingle = await _adRepository.fetchAdData(ad);
      adSink.add(Response.completed(adSingle));
    } catch (e) {
      adSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _adController?.close();
  }
}
