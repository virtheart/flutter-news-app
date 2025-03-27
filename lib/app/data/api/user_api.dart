import 'package:dio/dio.dart';
import 'package:news/services/DioService.dart';

class UserApi {
  static final Dio _dio = DioService.instance.getDio();

  // 获取当前用户全部信息
  static Future<Response> info() async {
    return await _dio.get('/app/appuser/info');
  }
}
