/// 使用typedef 为方法类型命名

/// 未命名
class SortedCollection {
  Function compare;

  SortedCollection(int f(Object a, Object b)) {
    //赋值的时候丢失了方法类型信息
    compare = f;
  }
}
// Initial, broken implementation.
int sort(Object a, Object b) => 0;


/// 使用typedef命名函数
typedef int Compare(Object a, Object b);
class SortedCollection1 {
  Compare compare;

  SortedCollection1(this.compare);
}

int sort1(Object a, Object b) => 1;

main() {
  SortedCollection coll = SortedCollection(sort);
  SortedCollection1 coll1 = SortedCollection1(sort);

  // 我们只知道 compare 是一个 Function 类型，
  // 但是不知道具体是何种 Function 类型？
  assert(coll.compare is Function);

  assert(coll1.compare is Function);
  assert(coll1.compare is Compare);
  // 由于Compare只是别名，方法类型与Compare 相同都是Compare
  assert(sort1 is Compare);
}

