class Point {
  num x = 1;
  num y = 1;
  Point(){
    print('construct ${toString()}');
  }

  Point.simple(this.x, this.y);

  @override
  String toString() {
    return 'x:$x, y:$y';
  }
}

class Point2 extends Point{
  num z;

  /// 普通构造函数
  Point2(this.z);

  /// 命名构造函数
  Point2.simple(x, y, this.z): super.simple(x, y);

  /// super 必须放在最后, super中不能使用this关键字
  /// 初始化列表中只能使用当前类声明的成员变量
  Point2.initParams(x, y, z) : z = z + 111, super.simple(x + 111, y + 111);

  @override
  String toString() {
    return 'x: $x, y: $y, z: $z';
  }
}

/// 常量构造函数
class ImmutablePoint {
  final num x;
  final num y;
  const ImmutablePoint(this.x, this.y);
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  @override
  String toString() {
    return 'x: $x, y: $y';
  }
}

/// 工厂方法构造函数
/// 如果一个构造函数并不总是返回一个新的对象，则使用 factory 来定义 这个构造函数. 工厂构造方法内无法访问this!
class Logger {
  final String name;
  bool mute = false;
  static final Map<String, Logger> _cache =
  <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }
  /// 这里使用命名构造函数
  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}

void main(){
  var point = Point();
  point.x = 2;
  point.y = 2;
  print('point ${point.toString()}');
  // 继承类Point
  var point2 = Point2(4);
  print('point2 ${point2.toString()}');

  print('name constructors ----------------------------');
  var simple2 = Point2.simple(11, 22, 33);
  print(simple2.toString());

  print('init list --------------------------');
  var init = Point2.initParams(0, 1, 2);
  print(init.toString());

  print('constant constructors --------------------------');
  print('ImmutablePoint.origin : ${ ImmutablePoint.origin.toString()}');

  print('factory constructors ---------------------------');
  Logger logger = Logger('book');
  logger.log('this is book');
}
