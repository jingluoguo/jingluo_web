import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jingluo_web/app/common/base_page.dart';
import 'package:jingluo_web/app/modules/about/about_controller.dart';
import 'package:jingluo_web/app/theme/utils/export.dart';

class AboutPage extends BasePage<AboutController> {
  const AboutPage({super.key});

  Widget _buildSkill() {
    List<Widget> row = [];
    for (var skill in controller.skills) {
      row.add(Card(
        color: controller.colors[Random().nextInt(controller.skills.length)],
        child: Padding(
          padding: EdgeInsets.all(2.sp),
          child: Text(skill),
        ),
      ));
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: row,
    );
  }

  Widget _allScreen(double width) {
    return Center(
      child: SizedBox(
          width: width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello, I'm",
                  style: TextStyle(
                      color: const Color(0xffb7b7c3), fontSize: 16.sp)),
              Text("Jingluo Guo",
                  style: TextStyle(
                      color: const Color(0xffb7b7c3), fontSize: 34.sp)),
              Text("Flutter Software Engineer",
                  style: TextStyle(color: Colors.white, fontSize: 18.sp)),
              _buildSkill(),
            ],
          )),
    );
  }

  @override
  Widget buildBody(BuildContext context, double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      child: _allScreen(width),
    );
  }
}
