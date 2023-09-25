/// 第三方
import 'package:get/get.dart';
import 'package:jingluo_web/app/modules/about/about_controller.dart';

/// 本地资源
import 'splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
