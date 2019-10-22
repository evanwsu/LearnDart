
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

void main(){
  Map map = {
    "width": 1,
    "height": 2
  };
  Set set = {
    1,2
  };

  var x = 1.2;
  print("Price: ${d(x, 3,1)} USD");


}

