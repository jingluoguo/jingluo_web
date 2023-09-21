import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jingluo_web/app/theme/utils/export.dart';

import 'base_controller.dart';

abstract class BasePage<T extends BaseController> extends GetView<T> {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        drawer: drawer,
        body: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: onTap,
              child:
                  LayoutBuilder(builder: (context, BoxConstraints constraints) {
                final width = constraints.maxWidth;
                final height = constraints.maxHeight;
                return buildBody(context, width, height);
              }),
            );
          },
        ),
        backgroundColor: const Color(0xff0e0c36),
        bottomNavigationBar: buildBottomNavigationBar(context),
      ),
    );
  }

  bool get resizeToAvoidBottomInset => false;

  Widget? buildBottomNavigationBar(BuildContext context) {
    return null;
  }

  SystemUiOverlayStyle get systemUIOverlayStyle {
    return SystemUiOverlayStyle.dark;
  }

  BoxDecoration get boxDecoration => const BoxDecoration();

  void Function()? get onTap => () {
        return Get.hideKeyboard(Get.context!);
      };

  WillPopCallback get onWillPop => () async {
        return Get.global(null).currentState?.canPop() == true;
      };

  void Function(BuildContext context) get onScaffoldTap =>
      (BuildContext context) {};

  Widget? get drawer => null;

  Widget buildBody(BuildContext context, double width, double height);
}
