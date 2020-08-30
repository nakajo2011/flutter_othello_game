class DrawingOthelloApp {

  List<Quiz> findQuiz() {
    List<Quiz> result = new List<Quiz>();
    result.add(new Quiz('ブラックスター', 1, [
      0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0,
      0,0,0,0,1,0,0,0,
      0,0,0,1,1,1,0,0,
      0,0,1,1,1,1,1,0,
      0,0,0,1,1,1,0,0,
      0,0,0,0,1,0,0,0,
      0,0,0,0,0,0,0,0,
    ]));
    result.add(new Quiz('絨毯', 5, [
      2,2,1,1,2,2,1,1,
      2,2,1,1,2,2,1,1,
      1,1,2,2,1,1,2,2,
      1,1,2,2,1,1,2,2,
      2,2,1,1,2,2,1,1,
      2,2,1,1,2,2,1,1,
      1,1,2,2,1,1,2,2,
      1,1,2,2,1,1,2,2,
    ]));

    return result;
  }
}

class Quiz {
  String title;
  int level;
  List<int> state;

  Quiz(String title, int level, List<int> state) {
    this.title = title;
    this.level = level;
    this.state = state;
  }
}