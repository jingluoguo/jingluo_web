/// 第三方
import 'package:get/get.dart';
import 'package:jingluo_web/app/common/base_controller.dart';

import '../../routes/app_pages.dart';

class SplashController extends BaseController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offNamed(Routes.mainPage);
    super.onInit();
  }
}
