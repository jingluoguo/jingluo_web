import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:jingluo_web/app/routes/app_pages.dart';
import 'package:jingluo_web/app/theme/utils/logger.dart';
import 'package:jingluo_web/app/translation/translation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.initial,
      getPages: AppPages.pages,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
