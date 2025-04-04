import 'package:get/get.dart';
import 'package:news/app/controllers/global_controller.dart';
import 'package:news/app/data/api/article_api.dart';
import 'package:news/app/data/api/article_category_api.dart';
import 'package:news/app/data/api/carousel_api.dart';
import 'package:news/app/data/api/user_api.dart';
import 'package:news/app/data/models/article_category_model.dart';
import 'package:news/app/data/models/article_model.dart';
import 'package:news/app/data/models/carousel_model.dart';
import 'package:news/app/data/models/user_info_model.dart';
import 'package:news/app/routes/app_pages.dart';

class HomeController extends GetxController {

  final articleCategoryList = <ArticleCategoryModel>[].obs;
  final carouselList = <CarouselModel>[].obs;
  final recommendArticle = ArticleModel().obs;

  // 当前选中的分类
  final currentCategory = 0.obs;

  // 当前选中分类的文章
  final currentCategoryArticle = ArticleModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticleCategory();
    fetchRecommendArticle();
    initUserInfo();
    initCarousel();
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
      update(['currentCategory']),
    });
  }

  // 获取推荐文章
  void fetchRecommendArticle() {
    ArticleApi.recommend().then((value) => {
      recommendArticle.value = ArticleModel.fromJson(value.data['data']),
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

  // 初始化轮播
  void initCarousel() {
    CarouselApi.list().then((value) => {
      carouselList.value = (value.data['data'] as List).map((item) => CarouselModel.fromJson(item)).toList(),
    });
  }

  // 切换分类
  void switchCategory(int index) {
    currentCategory.value = index;
    ArticleApi.page(cid: articleCategoryList[index].id!).then((value) => {
      currentCategoryArticle.value = ArticleModel.fromJson(value.data['data']),
    });
    update(['currentCategoryArticle', 'currentCategory']);
  }

  // 轮播图点击
  void onCarouselTap (int index) {
    Get.toNamed(Routes.DETAIL, arguments: {'id': carouselList[index].appArticle?.id});
  }

  // 推荐文章点击
  void onRecommendArticleTap (String id) {
    Get.toNamed(Routes.DETAIL, arguments: {'id': id});
  }

  // 分类文章点击
  void onCategoryArticleTap (String id) {
    Get.toNamed(Routes.DETAIL, arguments: {'id': id});
  }

}
