import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../services/DioService.dart';

class AuthApi {
  static final Dio _dio = DioService.instance.getDio();

  static String _generateBasicAuthHeader(String clientId, String clientSecret) {
    final credentials = '$clientId:$clientSecret';
    final bytes = utf8.encode(credentials);
    final base64Str = base64.encode(bytes);
    return 'Basic $base64Str';
  }

  static Future<Response> login({
    required String username,
    required String password,
    String clientId = 'app',
    String clientSecret = 'app',
  }) async {
    final data = {
      'username': username,
      'password': password,
      'scope': 'server',
    };

    return await _dio.post(
      '/auth/oauth2/token?grant_type=password',
      data: data,
      options: Options(
        headers: {
          'content-type': 'application/x-www-form-urlencoded',
          'Authorization': _generateBasicAuthHeader(clientId, clientSecret),
        },
      ),
    );
  }
}