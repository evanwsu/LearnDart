abstract class Shape {
  num left;
  num top;
  num width;
  num height;

  Shape(this.left, this.top, this.width, this.height);

  num get right => left + width;

  set right(num value) => left = value - width;

  num get bottom => top + height;

  set bottom(num value) => top = value - height;

  ///name get抽象方法
  String get name;
}

class Rectangle extends Shape {
  Rectangle(num left, num top, num width, num height)
      : super(left, top, width, height);

  @override
  String get name => runtimeType.toString();
}

void main() {
  Shape shape = Rectangle(3, 4, 20, 15);

  assert(shape.left == 3);
  shape.right = 20;
  assert(shape.left == 0);

  Type type = Rectangle;
  assert(shape.name == type.toString());

  print('shape name：${shape.name}');
}
