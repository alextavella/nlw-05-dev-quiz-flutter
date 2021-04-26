import 'package:devquiz/data/models/models.dart';
import 'package:devquiz/presentation/pages/challenge/challenge_controller.dart';
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
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    this.controller.pageSizeNotifier.addListener(() {
      this.setState(() {});
    });
    this.controller.respondedNotifier.addListener(() {
      this.setState(() {});
    });

    this.pageController.addListener(() {
      this.controller.currentPage = pageController.page!.toInt() + 1;
      this.controller.responded = false;
    });

    super.initState();
  }

  void nextPage() {
    this
        .pageController
        .nextPage(duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  void respond() {
    this.controller.responded = true;
  }

  @override
  Widget build(BuildContext context) {
    this.controller.pageSize = widget.questions.length;

    final quizWidgets = widget.questions.map(
      (question) => QuizWidget(
        title: question.title,
        question: question,
        disabled: this.controller.responded,
      ),
    );

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
            top: true,
            child: ValueListenableBuilder(
              valueListenable: this.controller.currentPageNotifier,
              builder: (context, value, _) => QuestionIndicatorWidget(
                currentPage: this.controller.currentPage,
                pageSize: this.controller.pageSize,
              ),
            ),
          )),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: quizWidgets.toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ButtonWidget.normal(
                  label: "Pular",
                  onTap: this.nextPage,
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                child: ButtonWidget.primary(
                  label: "Confirmar",
                  onTap: this.respond,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
