/// 第三方
import 'package:get/get.dart';
import 'package:jingluo_web/app/modules/articles/articles_controller.dart';
import 'package:jingluo_web/app/modules/home/home_controller.dart';

/// 本地资源
import 'main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(ArticlesController());
  }
}
