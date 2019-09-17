/// dart 2.3后新增了一下操作符

/// 扩展操作符非空判断
testNullExpand(){
  var list;
  var list2 = [0, ...?list];
  assert(list2.length == 1);
}
/// 集合构建使用If判断
collectionIf(){
  var promoActive = true;
  var nav = [
    'Home',
    'Furniture',
    'Plants',
    if (promoActive) 'Outlet'
  ];
  print('nav : $nav');
}
/// 构建集合时使用for循环
collectionFor(){
  var listOfInts = [1, 2, 3];
  var listOfStrings = [
    '#0',
    for (var i in listOfInts) '#$i'
  ];
  assert(listOfStrings[1] == '#1');
}

void main(){
  testNullExpand();
  collectionIf();
  collectionFor();

  var sets = {'a',1};
  print('sets : $sets');

  var maps = {'name': 'evan', 'age': 16};
  assert(maps['name'] == 'evan' && maps['age'] == 16);
}
