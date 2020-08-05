import 'dart:async';

class CounterStream {
  int _counter = 0;
  StreamController<int> _streamController = new StreamController<int>();
  Stream<int> get counterUpdates => _streamController.stream;
  // Counter() {
  //   _streamController.add(_counter);
  // }

  void incrementCounter() {
    _counter++;
    _streamController.add(_counter);
  }
}
