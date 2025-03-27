import 'package:get/get.dart';
import 'package:news/app/controllers/global_controller.dart';
import 'package:news/app/data/api/article_category_api.dart';
import 'package:news/app/data/api/user_api.dart';
import 'package:news/app/data/models/article_category_model.dart';
import 'package:news/app/data/models/user_info_model.dart';

class HomeController extends GetxController {

  final articleCategoryList = <ArticleCategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticleCategory();
    initUserInfo();
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

  // 初始化用户信息
  void initUserInfo() {
    UserApi.info().then((value) => {
      Get.find<GlobalController>().userInfo.value = UserInfoModel.fromJson(value.data['data']),
      // 更新
      Get.find<GlobalController>().update()
    });
  }

}
