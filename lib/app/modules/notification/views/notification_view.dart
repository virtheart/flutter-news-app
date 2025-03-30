import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040A0F),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 76.h,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '通知中心',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 44.r,
                  height: 44.r,
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    color: const Color(0xFF081117),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/icons/setting.png'),
                )
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 1,
                itemBuilder: (_, index) => SizedBox(
                  height: 52.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 52.r,
                            height: 52.r,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0C1923),
                              borderRadius: BorderRadius.circular(30.sp),
                            ),
                            padding: EdgeInsets.all(14.r),
                            child:
                                Image.asset('assets/images/icons/verify.png'),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          SizedBox(
                            width: 200.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Account Verification',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Please verify to secure your account',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    color: const Color(0xFF8E9499),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Just Now',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF8E9499),
                        ),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (_, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Container(
                      width: double.infinity,
                      height: 1.h,
                      color: const Color(0xFF0C1923),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
