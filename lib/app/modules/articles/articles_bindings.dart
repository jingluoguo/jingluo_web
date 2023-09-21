/// 第三方
import 'package:get/get.dart';

/// 本地资源
import 'articles_controller.dart';

class ArticlesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticlesController());
  }
}
