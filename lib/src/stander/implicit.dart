
class Person{
  final _name;
  Person(this._name);

  String greet(who) => 'Hello, $who. I am $_name.';
}

/// 实现了Person类，覆写Person类中的成员（属性和方法）
class Imposter implements Person {
  @override
  get _name => '';

  @override
  String greet(who) {
    return 'Hi $who. Do you know who I am?';
  }

  noSuchMethod(Invocation invocation) {
    print('custom noSuchMethod');
  }
}

greetBob(Person person) => person.greet('bob');

void main(){
  print(greetBob(Person('kathy')));
  print(greetBob(Imposter()));

  Imposter().noSuchMethod(null);
}
