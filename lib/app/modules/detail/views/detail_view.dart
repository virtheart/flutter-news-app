import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:news/config.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040A0F),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Obx(
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
                                      backgroundColor:
                                          Colors.white.withOpacity(0.1),
                                      fixedSize:
                                          Size(44.r, 44.r), // 设置按钮尺寸为44x44
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () => Get.back(),
                                    icon: const Icon(Icons.more_vert,
                                        color: Colors.white), // 修改图标为三个点
                                    style: IconButton.styleFrom(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.1),
                                      fixedSize:
                                          Size(44.r, 44.r), // 设置按钮尺寸为44x44
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 4.w),
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
                              controller.userInfo.value.appUser != null
                                  ? Row(
                                      children: [
                                        Text(
                                          controller.userInfo.value.appUser!
                                              .nickname!,
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.72),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ]),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 20.h,
                            ),
                            child: Html(
                              data: controller.articleDetail.value.content!,
                              style: {
                                'body': Style(
                                  color: Colors.white,
                                ),
                                'code': Style(
                                  backgroundColor: Colors.grey[800], // 背景颜色
                                  color: Colors.greenAccent, // 文字颜色
                                  padding: HtmlPaddings.all(4), // 内边距
                                ),
                              },
                            )),
                        // 相关文章
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 20.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '相关文章',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 220.h,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(top: 20.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 142.h,
                                            width: 263.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  AppConfig.baseUrl +
                                                      controller.articleDetail
                                                          .value.image!,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Text(
                                            '文章标题',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Row(children: [
                                            Text(
                                              '2024-08-08',
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.72),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Container(
                                              width: 2.r,
                                              height: 2.r,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 4.w),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.72),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Text(
                                              '作者',
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.72),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ])
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(width: 16.w);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80.h,
                        ),
                      ],
                    ),
            ),
          ),
          // 显示在底部，可以将这个容器放在 Stack 中，并使用 Positioned 定位到底部
          GetBuilder<DetailController>(
            id: 'detail',
            builder: (detailController) => Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                bottom: 16.h,
              ),
              child: Container(
                height: 50.h, // 可以根据需要设置高度
                width: detailController.scrollOffset.value > 180 ? 300.w : 248.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: const Color(0xFF0D1B25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // 阴影颜色
                      spreadRadius: 2, // 阴影扩散程度
                      blurRadius: 5, // 阴影模糊程度
                      offset: const Offset(0, 3), // 阴影偏移量
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    detailController.scrollOffset.value > 180
                        ? Row(
                            children: [
                              IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.white), // 设置图标颜色为白色
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.1),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/like.svg',
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Text(
                                '128',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/message.svg',
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Text(
                                '128',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/archive-minus.svg',
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Text(
                                '82',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
