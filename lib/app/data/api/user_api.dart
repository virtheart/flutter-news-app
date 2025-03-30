import 'package:dio/dio.dart';
import 'package:news/app/data/models/user_info_model.dart';
import 'package:news/services/DioService.dart';

class UserApi {
  static final Dio _dio = DioService.instance.getDio();

  // 获取当前用户全部信息
  static Future<Response> info() async {
    return await _dio.get('/app/appuser/info');
  }

  // 修改个人信息
  static Future<Response> updateUserInfo(AppUser data) async {
    return await _dio.put('/edit', data: data);
  }

  // 修改密码
  static Future<Response> updatePassword(String password) async {
    return await _dio.put('/edit', data: {
      'newpassword1': password
    });
  }

  // 查询用户信息
  static Future<Response> queryUserInfo(String username) async {
    return await _dio.get('/app/appuser/info/$username');
  }

}
