import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/app/data/api/auth_api.dart';
import 'package:news/app/data/models/auth.dart';
import 'package:news/app/routes/app_pages.dart';
import 'package:news/services/HiveStorageService.dart';

class LoginController extends GetxController {
  final obscureText = true.obs;
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final TextEditingController usernameController = TextEditingController(text: "xiaoke");
  final TextEditingController passwordController = TextEditingController(text: "123456");

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() {
    final storage = HiveStorageService();
    AuthApi.login(username: usernameController.text, password: passwordController.text).then((value) {
      final authData = AuthModel.fromJson(value.data);
      storage.save("accessToken", authData.accessToken);
      storage.save("refreshToken", authData.refreshToken);
      storage.save("authData", authData);
      storage.save("isSplash", true);
      // 进入主界面
      Get.offAllNamed(Routes.ROOT);
    });
  }

}
