import 'package:get/get.dart';
import 'package:news/app/routes/app_pages.dart';
import 'package:news/services/HiveStorageService.dart';

class RootController extends GetxController {

  final RxBool isSplash = false.obs; // 用于控制是否显示SplashScree
  final currentIndex = 0.obs; // 当前选中的页面索引
  final navBarIndex = 0.obs; // 底部导航栏的选中状态

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
    if (index == 2) {
      Get.toNamed(Routes.PUBLISH);
      return;
    }
    // 更新底部导航栏索引
    navBarIndex.value = index;
    
    // 映射底部导航栏索引到视图索引
    // 索引0和1保持不变
    // 索引3映射到视图索引2（NotificationView）
    // 索引4映射到视图索引3（ProfileView）
    if (index < 2) {
      currentIndex.value = index;
    } else if (index == 3) {
      currentIndex.value = 2; // NotificationView
    } else if (index == 4) {
      currentIndex.value = 3; // ProfileView
    }
  }
  
}
