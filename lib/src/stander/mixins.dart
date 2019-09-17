// 单纯的mixin类
mixin Musical{
  bool canPlayPiano = false;
  // 能够作曲
  bool canCompose = false;
  // 能够指挥
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('弹吉他...');
    }
    if (canConduct) {
      print('指挥...');
    }
    if (canCompose ){
      print('作曲...');
    }
  }
}

class Musician with Musical {
  var name;
  Musician(String musicianName){
    name = musicianName;
    canPlayPiano = true;
    canCompose = true;
  }
}

class Maestro with Musical{
  var name;
  Maestro(String maestroName) {
    name = maestroName;
    canPlayPiano = true;
    canCompose = true;
    canConduct = true;
  }
}

void main(){
  Musician musician = Musician('李玉刚');
  Maestro maestro = Maestro('李大毛');
  musician.entertainMe();
  maestro.entertainMe();
}
