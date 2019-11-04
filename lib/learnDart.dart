
class A{
  double height;
  double width;

  A( double height, double width){
    this.height = height;
    this.width = width;
  }
}

String d(double value, int minLength, [int maxLength]) =>
    (maxLength == null ? "$value" : value.toStringAsFixed(maxLength)).padLeft(minLength, " ");

var t_map;
void main(){
  Map map = {
    "width": 1,
    "height": 2
  };
  var x = 1.2;
  print("Price: ${d(x, 3,1)} USD");

  print('map :$map');
  // ==?表示如果当前值为null就赋值给它
  t_map ??= map;
  print('t_map: $t_map');

  final lists = List.filled(10000, []);
  final start  = DateTime.now().millisecondsSinceEpoch;
  for (var value in lists) {
  }
  print('for in use time: ${DateTime.now().millisecondsSinceEpoch - start}');

  final start2  = DateTime.now().millisecondsSinceEpoch;
  final length = lists.length;
  for(var i = 0; i< length; i++){};
  print('for normal use time: ${DateTime.now().millisecondsSinceEpoch - start2}');

  final start3  = DateTime.now().millisecondsSinceEpoch;
  lists.forEach((vale) => {});
  print('for each use time: ${DateTime.now().millisecondsSinceEpoch - start3}');



}

