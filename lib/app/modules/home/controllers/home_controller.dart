import 'package:get/get.dart';
import 'package:news/app/data/api/article_category_api.dart';
import 'package:news/app/data/models/article_category_model.dart';

class HomeController extends GetxController {

  final articleCategoryList = <ArticleCategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticleCategory();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 获取文章分类
  void fetchArticleCategory() {
    ArticleCategoryApi.list().then((value) => {
      articleCategoryList.value = (value.data['data'] as List).map((item) => ArticleCategoryModel.fromJson(item)).toList(),
    });
  }

}
