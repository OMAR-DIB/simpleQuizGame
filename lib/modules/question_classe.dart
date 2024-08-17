class QuizQuestion {
  const QuizQuestion(this.quest, this.answer);

  final String quest;
  final List<String> answer;

  List<String> getShuffeldQuestion() {
    final shufelled = List.of(answer);
    shufelled.shuffle();
    return shufelled;
  }
}
