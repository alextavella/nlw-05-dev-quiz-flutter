import 'package:flutter/cupertino.dart';

class QuizController {
  final selectedIndexNotifier = ValueNotifier<int?>(null);

  int? get selectedIndex => selectedIndexNotifier.value;
  set selectedIndex(int? value) => selectedIndexNotifier.value = value;
}
