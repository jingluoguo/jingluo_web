import 'package:flutter/material.dart';
import 'package:jingluo_web/app/common/base_page.dart';
import 'package:jingluo_web/app/modules/splash/splash_controller.dart';

class ContactPage extends BasePage<SplashController> {
  const ContactPage({super.key});

  @override
  Widget buildBody(BuildContext context, double width, double height) {
    return Container(
      width: width,
      height: height,
      color: Colors.black12,
      child: const Center(
        child: Text("Contact Page"),
      ),
    );
  }
}
