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
    this.pageController.addListener(() {
      this.controller.currentPage = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  void nextPage() {
    this
        .pageController
        .nextPage(duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    final quizWidgets = widget.questions.map((question) => QuizWidget(
          title: question.title,
          question: question,
        ));

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
            top: true,
            child: ValueListenableBuilder(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => QuestionIndicatorWidget(
                currentPage: controller.currentPage,
                pageSize: widget.questions.length,
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
                    onTap: () {
                      this.pageController.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.linear);
                    }),
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
