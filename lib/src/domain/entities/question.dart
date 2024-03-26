class Question {
  Question(this.title, this.answers);

  final String title;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
