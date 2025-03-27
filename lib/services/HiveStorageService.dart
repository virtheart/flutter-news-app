import 'package:hive_flutter/hive_flutter.dart';

class HiveStorageService {
  // 单例实例
  static final HiveStorageService _instance = HiveStorageService._internal();
  static const String _defaultBoxName = 'globalBox';

  late Box<dynamic> _box;
  bool _isInitialized = false;

  // 工厂构造函数
  factory HiveStorageService() {
    return _instance;
  }

  // 私有构造函数
  HiveStorageService._internal();

  /// 初始化Hive存储
  /// [boxName]: 可选的自定义盒子名称
  Future<void> init({String? boxName}) async {
    if (_isInitialized) return;

    try {
      await Hive.initFlutter();
      _box = await Hive.openBox<dynamic>(boxName ?? _defaultBoxName);
      _isInitialized = true;
    } catch (e) {
      throw Exception('Failed to initialize Hive: $e');
    }
  }

  /// 存储数据
  Future<void> save(String key, dynamic value) async {
    _checkInitialization();
    await _box.put(key, value);
  }

  /// 读取数据
  dynamic read(String key, {dynamic defaultValue}) {
    _checkInitialization();
    return _box.get(key, defaultValue: defaultValue);
  }

  /// 读取强类型数据
  T? readAs<T>(String key, {T? defaultValue}) {
    _checkInitialization();
    return _box.get(key, defaultValue: defaultValue) as T?;
  }

  /// 检查键是否存在
  bool containsKey(String key) {
    _checkInitialization();
    return _box.containsKey(key);
  }

  /// 删除数据
  Future<void> delete(String key) async {
    _checkInitialization();
    await _box.delete(key);
  }

  /// 清空所有数据
  Future<void> clearAll() async {
    _checkInitialization();
    await _box.clear();
  }

  /// 获取所有键
  Iterable<dynamic> getAllKeys() {
    _checkInitialization();
    return _box.keys;
  }

  /// 关闭盒子
  Future<void> close() async {
    if (_isInitialized) {
      await _box.close();
      _isInitialized = false;
    }
  }

  // 检查是否已初始化
  void _checkInitialization() {
    if (!_isInitialized) {
      throw Exception('HiveStorageService has not been initialized. Call init() first.');
    }
  }
}