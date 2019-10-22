/// mixin的方法会覆盖父类中的方法

/// 使用on 来指定当前类必须实现State
mixin Person on State{
  @override
  void dispose() {
    print('Person dispose');
    // super 会指向当前对象的super.dispose
    super.dispose();
  }
}

abstract class State{
  void dispose(){
    print('State dispose');
  }
}

abstract class BaseStudent extends State{
  @override
  void dispose() {
    print('BaseStudent dispose');
  }
}
class Student extends BaseStudent with Person{

  @override
  void dispose() {
    super.dispose();
    print('Student dispose');
  }
}

void main(){
  Student student = Student();
  student.dispose();
}
