import 'package:devquiz/core/core.dart';
import 'package:devquiz/data/models/models.dart';
import 'package:devquiz/presentation/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class IncorrectPage extends StatelessWidget {
  final AnswerModel answer;
  final VoidCallback callback;

  IncorrectPage({required this.answer, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.error),
          SizedBox(height: 40),
          Text(
            "Error :/",
            style: AppTextStyles.heading40,
          ),
          Text.rich(
            TextSpan(
              text: "Resposta correta: ",
              style: AppTextStyles.bodyBold,
              children: [
                TextSpan(
                  text: this.answer.title,
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
          SizedBox(height: 56),
          ButtonWidget.normal(
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
