import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:news/app/controllers/global_controller.dart';
import 'package:news/components/custom_image.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040A0F),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/home/home-top-bg.png',
                height: 340.h,
                width: double.infinity,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top: 76.h),
                width: double.infinity,
                child: Column(
                  children: [
                    GetBuilder<GlobalController>(
                      builder: (global) => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 头像
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: CustomImage(
                              url: global.userInfo.value.appUser?.avatar ?? '',
                              width: 80.r,
                              height: 80.r,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          // 名称
                          Text(
                            global.userInfo.value.appUser?.nickname ?? '',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          // 邮箱
                          Text(
                            global.userInfo.value.appUser?.email ?? '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF8E9499),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: 335.w,
                      height: 78.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D1B25),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 30.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '1950',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Following',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xFF8E9499),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 24.h,
                            width: 1.w,
                            color: const Color(0xFF172530),
                          ),
                          Column(
                            children: [
                              Text(
                                '529',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xFF8E9499),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 24.h,
                            width: 1.w,
                            color: const Color(0xFF172530),
                          ),
                          Column(
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Published',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xFF8E9499),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Obx(
            () => Container(
              margin: EdgeInsets.all(20.r),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFF081117),
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.currentIndex.value = 0;
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              color: controller.currentIndex.value == 0
                                  ? const Color(0xFF172530)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(32.r),
                            ),
                            alignment: Alignment.center,
                            height: 44.h,
                            width: 163.w,
                            child: Text(
                              'Preferences',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.currentIndex.value = 1;
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              color: controller.currentIndex.value == 1
                                  ? const Color(0xFF172530)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(32.r),
                            ),
                            alignment: Alignment.center,
                            height: 44.h,
                            width: 163.w,
                            child: Text(
                              'Collection',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Obx(
            () =>
                controller.currentIndex.value == 0 ? Container(
                  margin: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 52.r,
                            height: 52.r,
                            decoration: BoxDecoration(
                              color: const Color(0xFF081117),
                              borderRadius: BorderRadius.circular(32.r),
                            ),
                            padding: EdgeInsets.all(14.r),
                            child: SvgPicture.asset(
                              'assets/svgs/user.svg',
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nickname',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Change your nickname',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xFF8E9499),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF8E9499),
                          ),
                        ]
                      )
                    ],
                  ),
                ) : Container(),
          ),
        ],
      ),
    );
  }
}
