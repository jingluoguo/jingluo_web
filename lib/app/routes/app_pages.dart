import 'package:get/get.dart';
import 'package:jingluo_web/app/modules/main/main_bindings.dart';
import 'package:jingluo_web/app/modules/main/main_page.dart';
import 'package:jingluo_web/app/modules/splash/splash_bindings.dart';

import '../modules/splash/splash_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.splashPage;
  static final pages = [
    GetPage(
        name: Routes.splashPage,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.mainPage,
        page: () => const MainPage(),
        binding: MainBinding())
  ];
}
