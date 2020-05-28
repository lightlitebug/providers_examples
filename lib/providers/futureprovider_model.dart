Future<FutureProviderModel> futureProviderFunc() async {
  await Future.delayed(Duration(seconds: 2));
  return FutureProviderModel(counter: 1);
}

class FutureProviderModel {
  FutureProviderModel({this.counter});
  int counter;

  void incrementCounter() {
    counter++;
    print('FutureProvider: $counter');
  }
}
