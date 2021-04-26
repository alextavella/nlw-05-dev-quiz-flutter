import 'package:devquiz/core/core.dart';
import 'package:devquiz/data/models/models.dart';
import 'package:flutter/material.dart';

import './quiz_controller.dart';
import '../answer/answer_widget.dart';

class QuizWidget extends StatefulWidget {
  final String title;
  final QuestionModel question;
  final bool disabled;
  final Function onSelect;

  AnswerModel selected(int index) => this.question.answers[index];

  AnswerModel get correct =>
      this.question.answers.firstWhere((a) => a.isRight == true);

  const QuizWidget({
    Key? key,
    required this.title,
    required this.question,
    required this.onSelect,
    this.disabled = false,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  final quizController = QuizController();

  AnswerModel getAnswer(int index) => widget.question.answers[index];

  AnswerWidget renderAnswer(int index) {
    return AnswerWidget(
      answer: this.getAnswer(index),
      isSelected: index == this.quizController.selectedIndex,
      disabled: widget.disabled,
      onTap: () {
        this.quizController.selectedIndex = index;
        widget.onSelect(widget.selected(index), widget.correct);
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    this.quizController.selectedIndexNotifier.addListener(() {
      setState(() {});
    });

    super.initState();
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
