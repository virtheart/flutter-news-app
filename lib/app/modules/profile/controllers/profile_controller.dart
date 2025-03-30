import 'package:get/get.dart';

class ProfileController extends GetxController {

  // 当前选中的索引
  var currentIndex = 0.obs;
  // 主题切换
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 切换主题
  void toggleTheme(bool value) {
    isDarkMode.value = value;
  }

}
