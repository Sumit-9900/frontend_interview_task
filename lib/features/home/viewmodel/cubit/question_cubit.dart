import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionChanged(3));

  void changeQuestion(int index) {
    emit(QuestionChanged(index));
  }
}
