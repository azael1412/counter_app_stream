import 'dart:async';

class CounterStream {
  int _counter = 0;
  StreamController<int> _streamController = new StreamController<int>();
  Stream<int> get counterUpdates => _streamController.stream;
  // Counter() {
  //   _streamController.add(_counter);
  // }

  void incrementCounter() {
    this._counter++;
    //this._streamController.add(this._counter);
    this._streamController.sink.add(this._counter);
  }

  void dispose() {
    this._streamController.close();
  }
}
