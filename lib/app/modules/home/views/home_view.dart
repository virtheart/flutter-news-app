import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'package:get/get.dart';
import 'package:news/app/controllers/global_controller.dart';
import 'package:news/components/category_component.dart';
import 'package:news/components/custom_image.dart';
import 'package:news/config.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040A0F),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image.asset(
                  'assets/images/home/home-top-bg.png',
                  height: 340.h,
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 40.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 头像
                          GetBuilder<GlobalController>(
                            builder: (globalController) => Row(
                              children: [
                                Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CustomImage(
                                      url: globalController
                                              .userInfo.value.appUser?.avatar ??
                                          '',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome',
                                      style: TextStyle(
                                        color: const Color(0xFF8E9499),
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    Text(
                                      globalController.userInfo.value.appUser
                                              ?.nickname ??
                                          '',
                                      style: TextStyle(
                                        color: const Color(0xFFFFFFFF),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // 搜索
                          Container(
                            width: 160.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFF09151E),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Color(0xFF888888),
                                ),
                                Spacer(),
                                Text(
                                  'Search',
                                  style: TextStyle(
                                    color: Color(0xFF888888),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Obx(
                      () => Container(
                        padding: EdgeInsets.only(
                          top: 32.h,
                        ),
                        height: 253.h,
                        child: Swiper(
                          viewportFraction: 0.88,
                          outer: true,
                          autoplay: true,
                          itemCount: controller.carouselList.length,
                          loop: true,
                          transformer:
                              TDPageTransformer.scaleAndFade(scale: 0.88),
                          pagination: const SwiperPagination(
                            alignment: Alignment.center,
                            builder: TDSwiperPagination.dotsBar,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final data = controller.carouselList[index];
                            return TDImage(
                              imgUrl: AppConfig.baseUrl + data.image!,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 28.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 16.h,
                    ),
                    child: Text(
                      'Popular Category',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // 分类
                  Obx(
                    () => CategoryComponent(
                      category: controller.articleCategoryList.value,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 28.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommendation',
                          style: TextStyle(
                            color: const Color(0xFFFFFFFF),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // 更多
                        GestureDetector(
                          onTap: () {
                            // 跳转到更多页面
                          },
                          child: const Text(
                            'View All',
                            style: TextStyle(
                              color: Color(0xFF888888),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding: EdgeInsets.only(
                        top: 28.h,
                      ),
                      height: 300.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller.recommendArticle.value.records?.length ??
                                0,
                        itemBuilder: (context, index) {
                          final data =
                              controller.recommendArticle.value.records?[index];
                          return Container(
                            margin: EdgeInsets.only(right: 16.w),
                            width: 263.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CustomImage(
                                    url: data!.image!,
                                    width: 263.w,
                                    height: 142.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  data.title!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
