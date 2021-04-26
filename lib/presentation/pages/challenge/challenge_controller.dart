import 'package:flutter/cupertino.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(1);
  final pageSizeNotifier = ValueNotifier<int>(1);

  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  int get pageSize => pageSizeNotifier.value;
  set pageSize(int value) => pageSizeNotifier.value = value;

  bool get isLastPage {
    return this.currentPage == this.pageSize;
  }
}
