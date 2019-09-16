import 'dart:async';

/// 由于Exception 的构造函数是工厂构造函数，所以无法继承Exception，只能通过实现Exception
/// http://dart.goodev.org/guides/language/language-tour#exceptions%E5%BC%82%E5%B8%B8
class NetException implements Exception{
  final message;
  final code;

  NetException([this.code, this.message]);

  @override
  String toString() {
    var result = 'CustomException';
    if(code != null) result = '$result code: $code, ';
    if(message != null) result = '$result message: ${message}';
    return result;
  }
}

/// catch 可以携带两个参数， 第一个为抛出异常的对象， 第二个为堆栈信息
testCatch(){
  try{
    throw NetException(404, '网络错误');
  }catch(e, s){
    print('exception: $e \nstacktrace: $s');
  }
}

/// 使用on 来指定异常类型， 使用catch来捕获异常对象。如果on和发生的异常不匹配，则会抛出异常
testOnExceptionCatch(){
  try{
    throw NetException(404, '网络错误');
  }on NetException catch(e){
    print('exception: ${e.toString()}');
  }
}

/// 使用 on来指定异常类型， 如果申明类型是异常类型或者子类型都可以捕获
testOnException(){
  try{
    throw NetException(404, '网络错误');
  }on Exception{
    print('exception on network');
  }
}

void main(){
  // try...catch
//  testCatch();
  // try on exception
//  testOnException();
  // try on exception catch
//  testOnExceptionCatch();
}
