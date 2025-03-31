import 'package:get/get.dart';
import 'package:news/app/data/models/user_info_model.dart';

class GlobalController extends GetxController {
  // 修复：为 userInfo 提供一个初始值，避免潜在的空值问题
  final userInfo = Rx<UserInfoModel>(UserInfoModel());

}
