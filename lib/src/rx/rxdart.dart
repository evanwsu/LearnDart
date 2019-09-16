import 'dart:async';

import 'package:rxdart/rxdart.dart';

void main() {
  testStreamController();
}

/// 测试StreamController， 使用了add和listener
void testStreamController(){
  final controller = StreamController<int>();
  var streamObservable = Observable(controller.stream);
  var subscribe = streamObservable
      .interval(Duration(seconds: 1))
      .listen((value) => print('date: ${DateTime.now()} value: $value'));

  Observable.fromIterable([1, 2, 3, 4, 5])
      .listen((value) => {
    print('start add date: ${DateTime.now()}'),
    controller.add(value)
  });

  controller.add(123);

  destroy() {
    controller?.close();
    subscribe?.cancel();
  }
}
