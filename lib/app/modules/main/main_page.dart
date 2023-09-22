import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jingluo_web/app/common/base_page.dart';
import 'package:jingluo_web/app/modules/about/about_page.dart';
import 'package:jingluo_web/app/modules/articles/articles_page.dart';
import 'package:jingluo_web/app/modules/contact/contact_page.dart';
import 'package:jingluo_web/app/modules/home/home_page.dart';
import 'package:jingluo_web/app/modules/main/main_controller.dart';
import 'package:jingluo_web/app/modules/projects/projects_page.dart';
import 'package:jingluo_web/app/theme/utils/export.dart';

class MainPage extends BasePage<MainController> {
  const MainPage({super.key});

  Widget buildBarItem(int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: SizedBox(
          width: 36.dp,
          height: 16.dp,
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.titles[index],
                    style: TextStyle(
                        fontSize: 8.sp,
                        color: index == controller.nowSelectIndex.value
                            ? Colors.white
                            : Colors.blue),
                  ),
                  // index == controller.nowSelectIndex.value
                  //     ? Container(width: 26.dp, height: 1.dp, color: Colors.red)
                  //     : SizedBox(
                  //         height: 1.dp,
                  //       )
                ],
              )),
        ),
      ),
    );
  }

  Widget buildBarList() {
    List<Widget> list = [];
    for (int index = 0; index < controller.titles.length; index++) {
      list.add(buildBarItem(index));
    }
    return Padding(
      padding:
          EdgeInsets.only(left: 18.dp, right: 18.dp, top: 2.dp, bottom: 2.dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: list),
          AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) {
                return Transform.translate(
                    offset: Offset(controller.nowPosition + controller.offsetPosition * controller.animationController.value, 0),
                    child: Padding(
                      padding: EdgeInsets.only(right: (controller.titles.length - 1) * 36.dp),
                      child: Container(
                          width: 26.dp,
                          height: 1.dp,
                          color: Colors.red,
                          margin: EdgeInsets.only(left: 5.dp, right: 5.dp)),
                    ));
              })
        ],
      ),
    );
  }

  Widget topNavigationBar(BuildContext context, double width) {
    return width > 1100 ? buildBarList() : const SizedBox();
  }

  @override
  Widget buildBody(BuildContext context, double width, double height) {
    return Column(
      children: [
        topNavigationBar(context, width),
        Expanded(
            child: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePage(),
            AboutPage(),
            ArticlesPage(),
            ProjectsPage(),
            ContactPage(),
          ],
        )),
      ],
    );
  }

  @override
  BoxDecoration get boxDecoration =>
      const BoxDecoration(color: Color(0xff0e0c36));

  @override
  Widget buildBottomNavigationBar(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      if (constraints.maxWidth < 1100) {
        return Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 8.dp,
              unselectedFontSize: 8.dp,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.white,
              backgroundColor: const Color(0xff04021f),
              selectedLabelStyle: const TextStyle(color: Colors.red),
              unselectedLabelStyle: const TextStyle(color: Colors.white),
              currentIndex: controller.nowSelectIndex.value,
              onTap: (index) async {
                controller.nowSelectIndex.value = index;
                controller.pageController.jumpToPage(index);
              },
              items: controller.titles
                  .asMap()
                  .keys
                  .map((e) => BottomNavigationBarItem(
                      icon: Icon(
                        controller.icons[e],
                        size: 16.dp,
                      ),
                      activeIcon: Icon(
                        controller.activeIcons[e],
                        size: 16.dp,
                      ),
                      // ignore: deprecated_member_use
                      label: controller.titles[e]))
                  .toList(),
            ));
      }
      return const SizedBox();
    });
  }
}
