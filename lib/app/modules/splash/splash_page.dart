import 'package:flutter/material.dart';
import 'package:jingluo_web/app/common/base_page.dart';
import 'package:jingluo_web/app/modules/splash/splash_controller.dart';

class SplashPage extends BasePage<SplashController> {
  const SplashPage({super.key});

  @override
  Widget buildBody(BuildContext context, double width, double height) {
    return Container(
      width: width,
      height: height,
      color: width < 1100 ? Colors.blue : Colors.red,
    );
  }
}
