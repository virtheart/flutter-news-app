import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF09151E),
        child: Column(
          children: [
            Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300), // 过渡时间
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                      opacity: animation, child: child); // 淡入淡出效果
                },
                child: Image.asset(
                  controller.splashImage.value,
                  fit: BoxFit.cover,
                  width: 375.w,
                  height: 465.h,
                  key: ValueKey(controller.splashImage.value), // 使用图片路径作为key
                ),
              ),
            ),
            GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.primaryVelocity! > 0) {
                  // 右滑
                  controller.onSwipeRight();
                } else if (details.primaryVelocity! < 0) {
                  // 左滑
                  controller.onSwipeLeft();
                }
              },
              child: Obx(
                () => Container(
                  width: 375.w,
                  height: 347.h,
                  color: const Color(0xFF09151E),
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 12,
                    right: 12,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 113.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: controller.count.value == 0
                                  ? Colors.white
                                  : const Color(0xFF888888),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 113.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: controller.count.value == 1
                                  ? Colors.white
                                  : const Color(0xFF888888),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 113.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: controller.count.value == 2
                                  ? Colors.white
                                  : const Color(0xFF888888),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 32.h),
                        child: Text(
                          controller.titleList[controller.count.value],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          controller.subTitleList[controller.count.value],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white.withOpacity(0.28),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 32.h),
                        child: TDButton(
                          text: "I’m New Here",
                          type: TDButtonType.fill,
                          shape: TDButtonShape.round,
                          theme: TDButtonTheme.primary,
                          height: 52.h,
                          width: double.infinity,
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 24.h),
                        child: Text(
                          "I already have an account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
