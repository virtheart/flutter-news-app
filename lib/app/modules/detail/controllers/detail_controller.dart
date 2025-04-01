import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/app/controllers/global_controller.dart';
import 'package:news/app/data/api/article_api.dart';
import 'package:news/app/data/api/user_api.dart';
import 'package:news/app/data/models/article_detail_model.dart';
import 'package:news/app/data/models/user_info_model.dart';

class DetailController extends GetxController {
  final ScrollController scrollController = ScrollController();

  // 评论高度
  final detailCommentHeight = 648.obs;

  // 页面滑动距离
  final scrollOffset = 0.0.obs;

  // 文章详情
  final articleDetail = ArticleDetailModel().obs;
  final userInfo = UserInfoModel().obs;

  @override
  void onInit() {
    super.onInit();
    // 获取文章ID
    final id = Get.arguments['id'] ?? '';
    if (id.isNotEmpty) {
      fetchArticleDetail(id);
    }
    scrollController.addListener(() {
      scrollOffset.value = scrollController.offset;
      if (scrollOffset.value > 100) {
        update(['detail']);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void fetchArticleDetail(String id) {
    // 获取用户ID
    final userId = Get.find<GlobalController>().userInfo.value.appUser?.userId;
    ArticleApi.detail(id: id, userId: userId ?? '1').then((value) => {
          articleDetail.value = ArticleDetailModel.fromJson(value.data['data']),
          UserApi.queryUserInfo(articleDetail.value.createBy!).then((value) => {
                userInfo.value = UserInfoModel.fromJson(value.data['data']),
              }),
        });
  }
}
