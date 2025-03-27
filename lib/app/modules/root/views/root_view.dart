import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/bookmark/views/bookmark_view.dart';
import 'package:news/app/modules/home/views/home_view.dart';
import 'package:news/app/modules/notification/views/notification_view.dart';
import 'package:news/app/modules/profile/views/profile_view.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF040A0F),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            HomeView(),
            BookmarkView(),
            NotificationView(),
            ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 170, 170, 170),
                blurRadius: 8,
                spreadRadius: -3,
                offset: Offset(0, -1),
              ),
            ],
            color: const Color(0xFF040A0F),
            borderRadius: BorderRadius.circular(60),
          ),
          margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: controller.changePage,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: const Color(0xFF040A0F),
                  icon: Image.asset(
                    'assets/images/icons/home.png',
                    width: 24,
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/icons/home-dark-active.png',
                    width: 24,
                    height: 24,
                  ),
                  label: '首页',
                ),
                BottomNavigationBarItem(
                  backgroundColor: const Color(0xFF040A0F),
                  icon: Image.asset(
                    'assets/images/icons/archive.png',
                    width: 24,
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/icons/archive-dark-active.png',
                    width: 24,
                    height: 24,
                  ),
                  label: '书签',
                ),
                BottomNavigationBarItem(
                  backgroundColor: const Color(0xFF040A0F),
                  icon: Image.asset(
                    'assets/images/icons/notification.png',
                    width: 24,
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/icons/notification-dark-active.png',
                    width: 24,
                    height: 24,
                  ),
                  label: '通知',
                ),
                BottomNavigationBarItem(
                  backgroundColor: const Color(0xFF040A0F),
                  icon: Image.asset(
                    'assets/images/icons/user.png',
                    width: 24,
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/icons/user-dark-active.png',
                    width: 24,
                    height: 24,
                  ),
                  label: '我的',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
