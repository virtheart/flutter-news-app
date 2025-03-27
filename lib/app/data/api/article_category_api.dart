import 'package:dio/dio.dart';
import 'package:news/services/DioService.dart';

class ArticleCategoryApi {
  static final Dio _dio = DioService.instance.getDio();

  static Future<Response> list() async {
    return await _dio.get('/app/appArticleCategory/list');
  }
}
