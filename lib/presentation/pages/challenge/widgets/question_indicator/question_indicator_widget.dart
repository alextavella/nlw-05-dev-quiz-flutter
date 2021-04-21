import 'package:devquiz/core/core.dart';
import 'package:devquiz/presentation/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Questão 04", style: AppTextStyles.body),
            Text("de 10", style: AppTextStyles.body),
          ]),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value: 0.4)
        ],
      ),
    );
  }
}
