import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';

class QuizCardWidget extends StatelessWidget {
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
        Container(width: 40, height: 40, child: Image.asset(AppImages.blocks)),
        SizedBox(height: 20),
        Text("Gerenciamento de Estado", style: AppTextStyles.heading15),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(flex: 1, child: Text("3/10", style: AppTextStyles.body11)),
            Expanded(
              flex: 4,
              child: LinearProgressIndicator(
                  value: 0.3,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary)),
            )
          ],
        )
      ]),
    );
  }
}
