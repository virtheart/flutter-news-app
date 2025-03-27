import 'package:get/get.dart';
import 'package:news/app/routes/app_pages.dart';
import 'package:news/services/HiveStorageService.dart';

class RootController extends GetxController {

  final RxBool isSplash = false.obs; // 用于控制是否显示SplashScree
  final currentIndex = 0.obs; // 当前选中的页面索引

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    final storage = HiveStorageService();
    try {
      isSplash.value = storage.read("isSplash");
    } catch (e) {
      isSplash.value = false;
    }
    if(!isSplash.value) {
      Get.offNamed(Routes.SPLASH);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changePage(int index) {
    currentIndex.value = index;
  }
  
}
