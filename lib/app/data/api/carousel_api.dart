import 'package:dio/dio.dart';
import 'package:news/services/DioService.dart';

// App轮播
class CarouselApi {
  static final Dio _dio = DioService.instance.getDio();

  static Future<Response> list() async {
    return await _dio.get('/app/appCarousel/list');
  }
}
