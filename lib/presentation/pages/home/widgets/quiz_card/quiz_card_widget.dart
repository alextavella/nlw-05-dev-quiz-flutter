import 'package:devquiz/core/core.dart';
import 'package:devquiz/data/models/quiz_model.dart';
import 'package:devquiz/presentation/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;

  const QuizCardWidget({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 40, height: 40, child: Image.asset(quiz.image)),
        SizedBox(height: 20),
        Text(quiz.title, style: AppTextStyles.heading15),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Text(
                    "${quiz.numAnsweredQuestion}/${quiz.questions.length}",
                    style: AppTextStyles.body11)),
            Expanded(
                flex: 4,
                child: ProgressIndicatorWidget(
                  value: quiz.numAnsweredQuestion / quiz.questions.length,
                ))
          ],
        )
      ]),
    );
  }
}
