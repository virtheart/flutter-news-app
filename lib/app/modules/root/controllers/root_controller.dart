import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:news/app/routes/app_pages.dart';
import 'package:news/services/HiveStorageService.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pgyer_updater/pgyer_updater.dart';

class RootController extends GetxController {
  final RxBool isSplash = false.obs; // 用于控制是否显示SplashScree
  final currentIndex = 0.obs; // 当前选中的页面索引
  final navBarIndex = 0.obs; // 底部导航栏的选中状态

  @override
  void onInit() {
    super.onInit();
    updateApp();
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
    if (!isSplash.value) {
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

  void updateApp() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final projectVersionName = packageInfo.version;
    print('projectVersionName: $projectVersionName');
    // 检查更新
    PgyerUpdater.check(
            apiKey: dotenv.env['PGY_API_KEY']!,
            appKey: dotenv.env['PGY_USER_KEY']!,
            versionName: projectVersionName)
        .then((result) {
      // 显示更新对话框
      PgyerUpdater.showUpdateDialog(
        Get.context!,
        versionResult: result,
        onConfirm: (appUrl) {
          //launchUrlString(appUrl);
          // 或者自行实现下载
          //final downloadUrl = PgyerUpdater.getDownloadUrl(result);
          //download(downloadUrl);
        },
      );
    });
  }
}
