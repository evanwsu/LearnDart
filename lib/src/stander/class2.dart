class A{
  int a;
  int b;
  A(this.a, this.b);

  add(){
    return a + b;
  }
}


class B extends A{
  int a;
  String c;

  B(this.a, this.c) : super(a, 1);
}

void main(){
  var b = B(2,"2");
  print('b: ${b.add()}');
}


