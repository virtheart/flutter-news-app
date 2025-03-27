import 'package:get/get.dart';
import 'package:news/app/routes/app_pages.dart';
import 'package:news/services/HiveStorageService.dart';

class RootController extends GetxController {

  final count = 0.obs;
  final RxBool isSplash = false.obs; // 用于控制是否显示SplashScree
  
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

  void increment() => count.value++;
}
