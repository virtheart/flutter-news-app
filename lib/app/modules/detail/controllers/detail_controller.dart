import 'package:get/get.dart';
import 'package:news/app/controllers/global_controller.dart';
import 'package:news/app/data/api/article_api.dart';

class DetailController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // 获取文章ID
    final id = Get.parameters['id'] ?? '';
    if (id.isNotEmpty) {
      fetchArticleDetail(id);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  
  void fetchArticleDetail(String id) {
    // 获取用户ID
    final userId = Get.find<GlobalController>().userInfo.value.appUser?.userId;
    ArticleApi.detail(id: id, userId: userId ?? '1').then((value) => {
      print(value.data)
    });
  }

}
