import 'package:get/get.dart';

class SplashController extends GetxController {

  final count = 0.obs;

  final splashImage = "".obs;

  final titleList = [
    "Get Instant Access to the News You Need",
    "Our News Made by Featured Content Creators",
    "Publish Your News with Ease in Our App",
  ].obs;

  final subTitleList = [
    "Stay informed with instant access to breaking news and personalized content.",
    "Our news app is made by content creators to provide you with the latest news, and personalized content.",
    "Share your news with the world with our easy-to-use app. Create and publish your own news  with just a few clicks.",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    splashImage.value = "assets/images/splash/splash1.png";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }



  void changeSplash(int index) {
    print(index);
    switch (index) {
      case 0:
        splashImage.value = "assets/images/splash/splash1.png";
        break;
      case 1:
        splashImage.value = "assets/images/splash/splash2.png";
        break;
      case 2:
        splashImage.value = "assets/images/splash/splash3.png";
        break;
    }
  }

  void onSwipeRight() {
    if (count.value < 2) {
      count.value++;
    } else {
      count.value = 0;
    }
    changeSplash(count.value);
  }

  void onSwipeLeft() {
    if (count.value > 0) {
      count.value--;
    } else {
      count.value = 2; // 当已经是第一张时，向左滑动到最后一张
    }
    changeSplash(count.value);
  }

}
