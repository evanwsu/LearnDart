/// 重写操作符

class Vector{
  final int x;
  final int y;
  const Vector(this.x, this.y);

  Vector operator +(Vector v){
    return Vector(x + v.x, y + v.y);
  }

  Vector operator -(Vector v){
    return Vector(x - v.x, y - v.y);
  }

  /// 这里需要注意 == 覆写后需要重写hasCode的get 方法。
  /// 参数类型应该是dynamic，如果指定了参数类型会使得Object.==操作符覆写无效
  bool operator ==(other){
    if(other is! Vector) return false;
    Vector vector = other;
    return x == vector.x && y == vector.y;
  }

  @override
  int get hashCode {
    int result = 11;
    result = 22 * result + x.hashCode;
    result = 22 * result + y.hashCode;
    return result;
  }
}

void main(){
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v.x == 2 && v.y == 3);

  assert((v + w).x == 4 && (v + w).y == 5);

  assert((v - w).x == 0 && (v - w).y == 1);

  assert(v != w);
}
