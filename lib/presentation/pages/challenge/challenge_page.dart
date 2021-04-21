import 'package:devquiz/presentation/pages/challenge/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: SafeArea(top: true, child: QuestionIndicatorWidget())),
        body: QuizWidget(title: "O que o Flutter faz em sua totalidade?"));
  }
}
