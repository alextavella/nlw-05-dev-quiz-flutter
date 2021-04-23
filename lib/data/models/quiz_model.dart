import 'dart:convert';

import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/data/models/question_model.dart';

enum QuizLevel {
  Facil,
  Medio,
  Dificil,
  Perito,
}

extension QuizLevelStringExt on String {
  QuizLevel get toQuizLevel => {
        "Facil": QuizLevel.Facil,
        "Medio": QuizLevel.Medio,
        "Dificil": QuizLevel.Dificil,
        "Perito": QuizLevel.Perito
      }[this]!;
}

extension QuizLevelExt on QuizLevel {
  String get fromQuizLevel => {
        QuizLevel.Facil: "Facil",
        QuizLevel.Medio: "Medio",
        QuizLevel.Dificil: "Dificil",
        QuizLevel.Perito: "Perito"
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final String image;
  final QuizLevel level;
  final int numAnsweredQuestion;

  const QuizModel({
    required this.title,
    required this.questions,
    required this.image,
    required this.level,
    this.numAnsweredQuestion = 0,
  }) : assert(
          questions.length >= 1,
        );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'image': image,
      'level': level.fromQuizLevel,
      'numAnsweredQuestion': numAnsweredQuestion,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      image: map['image'].toString().toImage,
      level: map['level'].toString().toQuizLevel,
      numAnsweredQuestion: map['numAnsweredQuestion'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
