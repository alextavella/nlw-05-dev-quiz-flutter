import 'package:devquiz/core/core.dart';
import 'package:devquiz/presentation/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int pageSize;

  QuestionIndicatorWidget({required this.currentPage, required this.pageSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Questão ${this.currentPage}",
                          style: AppTextStyles.body),
                      Text("de ${this.pageSize}", style: AppTextStyles.body),
                    ]),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SizedBox(height: 8),
          ProgressIndicatorWidget(value: this.currentPage / this.pageSize)
        ],
      ),
    );
  }
}
