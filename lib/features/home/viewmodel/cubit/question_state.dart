part of 'question_cubit.dart';

@immutable
sealed class QuestionState {}

final class QuestionChanged extends QuestionState {
  final int index;
  QuestionChanged(this.index);
}
