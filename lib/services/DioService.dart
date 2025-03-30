import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:news/app/routes/app_pages.dart';
import 'package:news/services/HiveStorageService.dart';

class DioService {
  // 私有静态实例
  static final DioService _instance = DioService._internal();
  
  // Logger实例
  static final Logger _logger = Logger();
  
  // Dio实例
  late final Dio dio;
  
  // 私有构造函数
  DioService._internal() {
    dio = Dio();
    
    // 基础配置
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'CLIENT-TOC': 'Y',
        'TENANT-ID': '1'
      },
    );
    
    // 初始化时尝试设置Authorization头
    try {
      final storage = HiveStorageService();
      final accessToken = storage.read('accessToken');
      if (accessToken != null) {
        dio.options.headers['Authorization'] = 'Bearer $accessToken';
      }
    } catch (e) {
      _logger.e('Failed to initialize token from Hive', error: e);
    }
    
    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          final storage = HiveStorageService();
          final token = storage.read('accessToken');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        } catch (e) {
          print('Failed to get token from Hive in interceptor: $e');
          return handler.next(options);
        }
      },
      onError: (error, handler) async {
        final storage = HiveStorageService();
        if (error.response?.statusCode == 401) {
          try {
            final responseData = error.response?.data;
            if (responseData is Map && responseData.containsKey('msg')) {
              final errorMsg = responseData['msg'];
              // 这里可以添加额外的处理逻辑，比如跳转到登录页面或清除token
              final storage = HiveStorageService();
              await storage.delete('token');
              Get.snackbar('系统提示', errorMsg);
            }
          } catch (e) {
            print('Failed to handle 401 error: $e');
          }
        }

        _logger.e('Dio error: ', error: error.response?.statusCode);
        _logger.e('Dio error: ', error: error.response?.data);

        // TODO: 需要单独处理，登录过期
        if (error.response?.statusCode == 424 && error.response?.data['msg'] == '用户凭证已过期' && storage.read('accessToken') != null) {
          // 延迟1秒执行
          Future.delayed(const Duration(seconds: 1), () {
            // 清空所有缓存
            storage.clearAll();
            Get.offAllNamed(Routes.LOGIN);
            Get.snackbar('系统提示', error.response?.data['msg']);
          });
          return;
        }

        return handler.next(error);
      },
    ));
  }
  
  // 全局访问点
  static DioService get instance => _instance;
  
  // 初始化配置
  Future<void> init({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 30),
    Duration sendTimeout = const Duration(seconds: 30),
    Map<String, dynamic> headers = const {
      'Content-Type': 'application/json',
      'CLIENT-TOC': 'Y',
      'TENANT-ID': '1'
    },
  }) async {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      headers: headers,
    );
    return Future.value();
  }
  
  // 获取Dio实例
  Dio getDio() => dio;
}