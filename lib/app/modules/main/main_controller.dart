import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jingluo_web/app/common/base_controller.dart';
import 'package:jingluo_web/app/theme/utils/export.dart';

class MainController extends BaseController with GetSingleTickerProviderStateMixin {
  var nowSelectIndex = 0.obs;
  late final AnimationController animationController;
  late Animation<double> animation;
  final int translation = 400;

  double nowPosition = 0.0;
  double offsetPosition = 0.0;

  List<String> titles = ['Home', 'About', 'Articles', 'Projects', 'Contact'];
  List<IconData> icons = [
    Icons.home,
    Icons.person,
    Icons.article,
    Icons.code,
    Icons.contacts
  ];
  List<IconData> activeIcons = [
    Icons.home,
    Icons.person,
    Icons.article,
    Icons.code,
    Icons.contacts
  ];

  PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: translation));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void _listen() {
    if (animationController.isCompleted) {
      offsetPosition = 0.0;
      nowPosition = nowSelectIndex.value * 36.dp;
    }
  }

  void changeTab(int index) {
    animationController.removeListener(_listen);
    offsetPosition = (index - nowSelectIndex.value) * 36.dp;
    nowSelectIndex.value = index;
    pageController.animateToPage(index, duration: Duration(milliseconds: translation), curve: Curves.easeIn);
    animationController.forward(from: 0.0);
    animationController.addListener(_listen);
  }
}
