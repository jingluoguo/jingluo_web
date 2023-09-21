import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jingluo_web/app/common/base_page.dart';
import 'package:jingluo_web/app/modules/articles/articles_controller.dart';
import 'package:jingluo_web/app/theme/utils/size_extension.dart';

class ArticlesPage extends BasePage<ArticlesController> {
  const ArticlesPage({super.key});

  @override
  Widget buildBody(BuildContext context, double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        width: width * 0.9,
        padding: EdgeInsets.all(16.dp),
        child: SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2.0,
              crossAxisSpacing: 12.dp,
              mainAxisSpacing: 12.dp,
              crossAxisCount: 4,
            ),
            itemBuilder: (ctx, index) {
              return MouseRegion(
                onEnter: (event) {
                  controller.nowHover.value = index;
                },
                onExit: (event) {
                  controller.nowHover.value = -1;
                },
                cursor: SystemMouseCursors.click,
                child: Obx(() => Container(
                      decoration: BoxDecoration(
                          color: controller.nowHover.value == index
                              ? Colors.white.withOpacity(0.2)
                              : null,
                          borderRadius: BorderRadius.circular(4.dp)),
                      child: Center(
                          child: Text(
                        "xxxxxx:$index",
                        style: const TextStyle(color: Colors.white),
                      )),
                    )),
              );
            },
            itemCount: 12,
          ),
        ),
      ),
    );
  }
}
