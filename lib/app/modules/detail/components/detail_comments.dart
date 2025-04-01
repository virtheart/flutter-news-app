import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/detail/controllers/detail_controller.dart';
import 'package:news/components/custom_image.dart';

class DetailComments extends StatelessWidget {
  const DetailComments({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      id: 'comment',
      builder: (controller) => Container(
        width: double.infinity,
        height: controller.detailCommentHeight.value.h,
        decoration: BoxDecoration(
          color: const Color(0xFF040A0F),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: 48.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0C1923),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Text(
                      'Comments',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 4.h,
                    ),
                    Container(
                      height: 24.r,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0C1923),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '11',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 24.r,
                      height: 24.r,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 38.r,
                            height: 38.r,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0C1923),
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: CustomImage(url: ''),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'User Name',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF8E9499),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              SizedBox(
                                width: 280.w,
                                child: Text(
                                  'SI absolutely love the winter season and the beauty of a snow-covered landscape. It\'s like walking in a fairy tale! ✨',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '12:30',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xFF8E9499),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Row(children: [
                                    const Icon(
                                      Icons.thumb_up,
                                      color: Color(0xFF8E9499),
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      '12',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color(0xFF8E9499),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  // 回复
                                  Text(
                                    'Reply',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xFF8E9499),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 20.h),
                        child: Container(
                          width: 280.w,
                          height: 1.h,
                          color: const Color(0xFF0C1923),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 56.h,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 44.h,
                  maxHeight: 132.h,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF0C1923),
                  borderRadius: BorderRadius.circular(32.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    SizedBox(
                      width: 220.w,
                      child: const TextField(
                        maxLines: null, // 允许文本自动换行
                        decoration: InputDecoration(
                          hintText: 'Type comment',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.alternate_email, // 替换为 @ 图标，通常使用 Icons.alternate_email
                        color: Colors.white,
                        size: 24.r,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.emoji_emotions, // 替换为表情包图标，使用 Icons.emoji_emotions
                        color: Colors.white,
                        size: 24.r,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
