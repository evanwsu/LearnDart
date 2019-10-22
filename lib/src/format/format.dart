import 'package:sprintf/sprintf.dart';


void main(){
  print(sprintf("%04i", [-42]));
  print(sprintf("%s %s", ["Hello", "World"]));
  print(sprintf("%#04x", [10]));

  print(sprintf("%4i",[033]));
  print(sprintf("%4d",[033]));
  print(sprintf("%d%%",[10]));
}
