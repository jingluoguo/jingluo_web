import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jingluo_web/app/common/base_page.dart';
import 'package:jingluo_web/app/model/article.dart';
import 'package:jingluo_web/app/modules/articles/articles_controller.dart';
import 'package:jingluo_web/app/theme/utils/export.dart';
import 'package:jingluo_web/app/theme/utils/size_extension.dart';

class ArticlesPage extends BasePage<ArticlesController> {
  const ArticlesPage({super.key});

  @override
  Widget buildBody(BuildContext context, double width, double height) {
    bool isSmallScreen = width < 1100;
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
              childAspectRatio: 1.6,
              crossAxisSpacing: 12.dp,
              mainAxisSpacing: 12.dp,
              crossAxisCount: isSmallScreen ? 1 : 3,
            ),
            itemBuilder: (ctx, index) => _buildItem(ctx, index),
            itemCount: controller.allArticles.value.length,
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext ctx, index) {
    Article article = controller.allArticles.value[index];
    return GestureDetector(
      onTap: () => print("xxxxx${article.link}"),
      child: MouseRegion(
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
                  : Colors.red,
              borderRadius: BorderRadius.circular(4.dp)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.dp), // 设置圆角半径
                  child: Image.asset(R.avatar, fit: BoxFit.cover,), // 加载图片
                ),
              )),
              Text(
                article.name!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp
                ),
              ),
              Text(
                article.date!,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 6.sp
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
