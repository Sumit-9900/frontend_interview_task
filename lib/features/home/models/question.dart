class Question {
  final String option;
  final String label;

  Question({required this.option, required this.label});
}

List<Question> questions = [
  Question(option: 'A', label: 'The peace in the early mornings'),
  Question(option: 'B', label: 'The magical golden hours'),
  Question(option: 'C', label: 'Wind-down time after dinners'),
  Question(option: 'D', label: 'The serenity past midnight'),
];
