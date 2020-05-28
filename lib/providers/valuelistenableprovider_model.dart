import 'package:flutter/material.dart';

class ValueListenableProviderModel extends ValueNotifier<double> {
  ValueListenableProviderModel(double counter) : super(counter) {
    incrementDoubleCounter();
  }

  void incrementDoubleCounter() async {
    Stream<double> stream = Stream<double>.periodic(Duration(seconds: 1), (x) {
      return x + 1.0;
    }).take(10);

    await for (double x in stream) {
      value = value + x;
      print('value in ValueListenableProvider: $value');
    }
  }
}
