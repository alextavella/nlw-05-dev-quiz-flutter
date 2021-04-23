import 'package:devquiz/data/models/models.dart';
import 'package:flutter/foundation.dart';

import './home_repository.dart';
import './home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.IDLE);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final homeRepository = HomeRepository();

  void getUser() async {
    this.state = HomeState.LOADING;
    this.user = await homeRepository.getUser();
    // this.state = HomeState.SUCCESS;
  }

  void getQuizzes() async {
    // this.state = HomeState.LOADING;
    this.quizzes = await homeRepository.getQuizzes();
    this.state = HomeState.SUCCESS;
  }
}
