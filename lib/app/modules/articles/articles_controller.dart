import 'package:get/get.dart';
import 'package:jingluo_web/app/common/base_controller.dart';
import 'package:jingluo_web/app/model/article.dart';
import 'package:jingluo_web/app/model/staticData.dart';

class ArticlesController extends BaseController {
  var nowHover = (-1).obs;

  var allData = StaticData.articles;

  var allArticles = Rx<List<Article>>([]);

  @override
  void onInit() {
    _initData();
    super.onInit();
  }

  void _initData() {
    for (var a in allData) {
      allArticles.value.add(Article.fromJson(a));
    }
  }
}
