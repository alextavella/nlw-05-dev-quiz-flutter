import 'dart:convert';

import 'package:devquiz/core/core.dart';
import 'package:devquiz/data/models/models.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final json = await rootBundle.loadString(AppDatabase.user);
    return UserModel.fromJson(json);
  }

  Future<List<QuizModel>> getQuizzes() async {
    final json = await rootBundle.loadString(AppDatabase.quizzes);
    final list = jsonDecode(json) as List;
    return list.map((e) => QuizModel.fromMap(e)).toList();
  }
}
