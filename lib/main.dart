import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:news/app/controllers/global_controller.dart';
import 'package:news/config.dart';
import 'package:news/services/DioService.dart';
import 'package:news/services/HiveStorageService.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化Hive全局存储
  await HiveStorageService().init();

  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   statusBarIconBrightness: Brightness.light,
  // ));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // 状态栏背景颜色
    statusBarIconBrightness: Brightness.dark, // dark: 通常显示为黑色图标
  ));

  // 初始化Dio
  await DioService.instance.init(
    baseUrl: AppConfig.baseUrl, // 请替换为实际的API基础URL
  );

  // 初始化全局控制器
  Get.put(GlobalController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: "News",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
