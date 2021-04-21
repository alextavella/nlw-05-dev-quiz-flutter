import 'package:devquiz/core/core.dart';
import 'package:devquiz/presentation/pages/challenge/widgets/answer/answer_widget.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              this.title,
              style: AppTextStyles.heading,
            ),
            SizedBox(
              height: 24,
            ),
            AnswerWidget(
                title:
                    "Possibilita a criação de aplicativos compilados nativamente."),
            AnswerWidget(
                isSelected: true,
                isRight: true,
                title:
                    "Possibilita a criação de aplicativos compilados nativamente."),
            AnswerWidget(
                isSelected: true,
                isRight: false,
                title:
                    "Possibilita a criação de aplicativos compilados nativamente.")
          ],
        ));
  }
}
