import 'package:flutter/material.dart';
import 'package:providers_examples/providers/futureprovider_model.dart';
import 'package:providers_examples/providers/provider_model.dart';
import 'package:providers_examples/providers/streamprovider_model.dart';

class ChangeNotifierModel with ChangeNotifier {
  int counter = 0;

  ProviderModel _provModel;
  ProviderModel get provModel => _provModel;

  set provModel(ProviderModel provModelVal) {
    if (_provModel != provModelVal) {
      _provModel = provModelVal;
      notifyListeners();
    }
  }

  FutureProviderModel _fModel;
  FutureProviderModel get fModel => _fModel;

  set fModel(FutureProviderModel fModelVal) {
    if (_fModel != fModelVal) {
      _fModel = fModelVal;
      notifyListeners();
    }
  }

  StreamProviderModel _sModel;
  StreamProviderModel get sModel => _sModel;
  int get myStreamValue => sModel.counter * 10;

  set sModel(StreamProviderModel sModelVal) {
    if (_sModel != sModelVal) {
      _sModel = sModelVal;
      notifyListeners();
    }
  }

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
