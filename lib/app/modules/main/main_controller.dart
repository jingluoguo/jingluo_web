import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jingluo_web/app/common/base_controller.dart';

class MainController extends BaseController {
  var nowSelectIndex = 0.obs;

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
}
