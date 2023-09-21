import 'package:flutter/material.dart';
import 'package:jingluo_web/app/common/base_page.dart';
import 'package:jingluo_web/app/modules/splash/splash_controller.dart';

class ProjectsPage extends BasePage<SplashController> {
  const ProjectsPage({super.key});

  @override
  Widget buildBody(BuildContext context, double width, double height) {
    return Container(
      width: width,
      height: height,
      color: Colors.white,
      child: const Center(
        child: Text("Projects Page"),
      ),
    );
  }
}
