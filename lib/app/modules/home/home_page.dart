import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jingluo_web/app/common/base_page.dart';
import 'package:jingluo_web/app/modules/splash/splash_controller.dart';
import 'package:jingluo_web/app/theme/utils/export.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends BasePage<SplashController> {
  const HomePage({super.key});

  List<Widget> _buildIconList() {
    return [
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Image.asset(
            R.github,
            color: const Color(0xffb7b7c3),
            width: 18.dp,
            height: 18.dp,
          ),
          onTap: () async {
            var url = Uri.parse(
                'https://github.com/jingluoguo/');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
        ),
      ),
      SizedBox(width: 2.dp),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Image.asset(
            R.csdn,
            width: 18.dp,
            height: 18.dp,
          ),
          onTap: () async {
            var url = Uri.parse(
                'https://blog.csdn.net/qq_38779672');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
        ),
      ),
    ];
  }

  Widget _bigScreen(double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: width * 0.56,
            height: height * 0.6,
            padding: EdgeInsets.only(left: width * 0.12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello, I am",
                    style: TextStyle(
                      color: const Color(0xffb7b7c3),
                      fontSize: 18.sp,
                    )),
                Text("Jingluo\nGuo",
                    style: TextStyle(
                        color: const Color(0xffb7b7c3), fontSize: 46.sp)),
                Text("Flutter Software Engineer",
                    style: TextStyle(color: Colors.white, fontSize: 8.sp)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Find me on",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 8.sp)),
                    SizedBox(height: 2.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _buildIconList(),
                    ),
                  ],
                )
              ],
            )),
        Container(
          width: width * 0.26,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(R.avatar))),
        ),
        const Expanded(child: SizedBox())
      ],
    );
  }

  Widget _smallScreen(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: width * 0.36,
          height: width * 0.36,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(R.avatar), fit: BoxFit.fill)),
        ),
        Container(
          width: width * 0.36,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(R.avatar))),
        ),
        SizedBox(
            width: width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hello, I'm",
                    style: TextStyle(
                        color: const Color(0xffb7b7c3), fontSize: 16.sp)),
                Text("Jingluo Guo",
                    style: TextStyle(
                        color: const Color(0xffb7b7c3), fontSize: 34.sp)),
                Text("Flutter Software Engineer",
                    style: TextStyle(
                        color: Colors.white, fontSize: 18.sp)),
                Text("Find me on",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white, fontSize: 12.sp)),
                Get.getHeightBox(6.dp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIconList(),
                )
              ],
            )),
      ],
    );
  }

  @override
  Widget buildBody(BuildContext context, double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      child: width > 1100 ? _bigScreen(width, height) : _smallScreen(width),
    );
  }
}
