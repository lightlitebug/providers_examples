Stream<StreamProviderModel> streamProviderFunc() {
  return Stream<StreamProviderModel>.periodic(Duration(seconds: 1),
      (counter) => StreamProviderModel(counter: counter + 1)).take(100);
}

class StreamProviderModel {
  StreamProviderModel({this.counter});
  int counter;

  void incrementCounter() {
    counter++;
    print('StreamProvider: $counter');
  }
}
