import 'package:devquiz/data/models/models.dart';
import 'package:devquiz/presentation/pages/challenge/widgets/widgets.dart';
import 'package:devquiz/presentation/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  ChallengePage({required this.questions});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
            top: true,
            child: QuestionIndicatorWidget(),
          )),
      body: QuizWidget(
        title: "O que o Flutter faz em sua totalidade?",
        question: widget.questions[0],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ButtonWidget.normal(label: "Pular", onTap: () {}),
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                child: ButtonWidget.primary(label: "Confirmar", onTap: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
