import 'dart:async';

import 'package:rxdart/rxdart.dart';

void main() {
  testStreamController();
//  testBehaviorSubject();
}


void testBehaviorSubject(){
  final subject = BehaviorSubject<int>.seeded(1);

  subject.stream.listen(print); // prints 1
  subject.stream.listen(print); // prints 1
  subject.stream.listen(print);
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
    print('start add date: ${DateTime.now()}， value: $value'),
    controller.add(value)
  });

  controller.add(123);

  Observable.timer(1, Duration(seconds: 2))
  .listen((value){
    controller.close();
  });

  destroy() {
    controller?.close();
    subscribe?.cancel();
  }
}
