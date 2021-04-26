import 'package:devquiz/core/core.dart';
import 'package:devquiz/data/models/models.dart';
import 'package:flutter/material.dart';

import '../answer/answer_widget.dart';

class QuizWidget extends StatefulWidget {
  final String title;
  final QuestionModel question;

  const QuizWidget({Key? key, required this.title, required this.question})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? selectedIndex;

  AnswerModel getAnswer(int index) => widget.question.answers[index];

  AnswerWidget renderAnswer(int index) {
    final answer = this.getAnswer(index);

    return AnswerWidget(
      answer: answer,
      isSelected: index == this.selectedIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              this.widget.title,
              style: AppTextStyles.heading,
            ),
            SizedBox(
              height: 24,
            ),
            for (var i = 0; i < widget.question.answers.length; i++)
              this.renderAnswer(i),
          ],
        ));
  }
}
