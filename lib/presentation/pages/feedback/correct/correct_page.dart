import 'package:devquiz/core/core.dart';
import 'package:devquiz/data/models/answer_model.dart';
import 'package:devquiz/presentation/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CorrectPage extends StatelessWidget {
  final AnswerModel answer;
  final VoidCallback callback;

  CorrectPage({required this.answer, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.check),
          SizedBox(height: 40),
          Text("Acertou!", style: AppTextStyles.heading40),
          Text(
            this.answer.title,
            style: AppTextStyles.body,
          ),
          SizedBox(height: 56),
          ButtonWidget.primary(
            label: "Avançar",
            onTap: () {
              Navigator.pop(context);
              this.callback();
            },
          ),
        ],
      ),
    );
  }
}
