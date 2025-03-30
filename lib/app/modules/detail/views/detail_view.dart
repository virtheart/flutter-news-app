import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:news/config.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.articleDetail.value.id == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    height: 425.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          AppConfig.baseUrl +
                              controller.articleDetail.value.image!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 76.h,
                        left: 20.w,
                        right: 20.w,
                        bottom: 20.h,
                      ),
                      child: Column(children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.white), // 设置图标颜色为白色
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.1),
                                fixedSize: Size(44.r, 44.r), // 设置按钮尺寸为44x44
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(Icons.more_vert,
                                  color: Colors.white), // 修改图标为三个点
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.1),
                                fixedSize: Size(44.r, 44.r), // 设置按钮尺寸为44x44
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 116.h,
                        ),
                        Row(
                          children: [
                            Text(
                              controller.articleDetail.value.createTime!,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.72),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Container(
                              width: 2.r,
                              height: 2.r,
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.72),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              controller.articleDetail.value.author!,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.72),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          controller.articleDetail.value.title!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          controller.articleDetail.value.summary!,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.72),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              controller.userInfo.value.appUser!.nickname!,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.72),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        )
                        // Container(
                        //   height: 425.h,
                        //   decoration: BoxDecoration(
                        //     gradient: LinearGradient(
                        //       begin: Alignment.topCenter,
                        //       end: Alignment.bottomCenter,
                        //       colors: [
                        //         Colors.transparent,
                        //         Colors.black.withOpacity(0.5),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ]),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
