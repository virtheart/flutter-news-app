import 'package:dio/dio.dart';
import 'package:news/services/DioService.dart';

/// 文章相关接口
class ArticleApi {
  static final Dio _dio = DioService.instance.getDio();

  /// 推荐文章
  static Future<Response> recommend() async {
    return await _dio.get('/app/appArticle/recommend');
  }

}
