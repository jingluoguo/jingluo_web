/// 第三方
import 'package:get/get.dart';

/// 本地资源
import 'home_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
