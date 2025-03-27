import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF040A0F),
      body: SingleChildScrollView(
        child: Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 20.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 44.r,
                    height: 44.r,
                    margin: EdgeInsets.only(top: 76.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0C1923),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.all(10.r),
                    child: Image.asset('assets/images/icons/arrow-left.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32.h),
                  child: Text(
                    "Login to Your Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Text(
                    "Fill in your login data so you can enjoy the features we provide here",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF8E9499),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                // 登录
                Padding(
                  padding: EdgeInsets.only(top: 32.h),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextField(
                            focusNode: controller.usernameFocusNode,
                            controller: controller.usernameController,
                            style: const TextStyle(
                                color: Colors.white), // 设置输入文字颜色为白色
                            decoration: InputDecoration(
                              hintText: "Enter your username",
                              hintStyle: const TextStyle(
                                color: Color(0xFF8E9499),
                              ),
                              fillColor: const Color(0xFF0C1923),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextField(
                            focusNode: controller.passwordFocusNode,
                            controller: controller.passwordController,
                            style: const TextStyle(
                              color: Colors.white,
                            ), // 设置输入文字颜色为白色
                            obscureText:
                                controller.obscureText.value, // 默认隐藏输入内容
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                              hintStyle: const TextStyle(
                                color: Color(0xFF8E9499),
                              ),
                              fillColor: const Color(0xFF0C1923),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // 根据 obscureText 状态显示不同图标
                                  controller.obscureText.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: const Color(0xFF8E9499),
                                ),
                                onPressed: () {
                                  // 点击图标时切换 obscureText 状态
                                  controller.obscureText.value =
                                      !controller.obscureText.value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32.h),
                  child: TDButton(
                    text: "Login",
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
                    onTap: () => controller.login(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'or login with',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF8E9499),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TDButton(
                      text: "Wechat",
                      type: TDButtonType.fill,
                      shape: TDButtonShape.round,
                      theme: TDButtonTheme.primary,
                      height: 52.h,
                      width: 162.w,
                      icon: Icons.wechat,
                      style: TDButtonStyle(
                        backgroundColor: const Color(0xFF0C1923),
                      ),
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TDButton(
                      text: "QQ",
                      type: TDButtonType.fill,
                      shape: TDButtonShape.round,
                      theme: TDButtonTheme.primary,
                      height: 52.h,
                      width: 162.w,
                      // 由于 Flutter 的 Icons 类中没有 'qq' 图标，这里替换为 Icons.mail
                      icon: Icons.mail,
                      style: TDButtonStyle(
                        backgroundColor: const Color(0xFF0C1923),
                      ),
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
