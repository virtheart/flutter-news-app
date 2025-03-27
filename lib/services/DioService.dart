import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news/services/HiveStorageService.dart';

class DioService {
  // 私有静态实例
  static final DioService _instance = DioService._internal();
  
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
      final token = storage.read('token');
      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      print('Failed to initialize token from Hive: $e');
    }
    
    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          final storage = HiveStorageService();
          final token = storage.read('token');
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