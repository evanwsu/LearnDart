import 'test2.dart' show Test2;

/// show组合器接收一个命名空间和一个标识符列表，并将标识符列表中出现的对象保留在命名空间。
/// hide 接收一个命名空间和标识符列表，并将标识符列表中出现的对象从命名空间中丢弃，然后产生一个新的命名空间。
/// 解决命名空间冲突使用as重新命名
class Test{
  static final hello = Test();
  Test(){
    print("test");
  }
}

void main(){
  /// 输出的是 test文件，因为当前库的声明高于导入库的声明
  print("${Test.hello}");

  print("show Test2 : ${Test2()}");
}

