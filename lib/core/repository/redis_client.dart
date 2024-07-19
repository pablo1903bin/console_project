import 'package:redis/redis.dart';

class RedisService {
  static RedisService? _instance; // puede ser null
  late RedisConnection _connection;
  late Command _command;
  bool _isConnected = false;

  RedisService._();

  static Future<RedisService> getInstance({
    String host = 'localhost',
    int port = 6379,
    String? password,
  }) async {
    if (_instance == null) {
      _instance = RedisService._();
      await _instance!._initialize(host, port, password);
    }
    return _instance!;
  }

  Future<void> _initialize(String host, int port, String? password) async {
    try {
      _connection = RedisConnection();
      _command = await _connection.connect(host, port);
      _isConnected = true;
      print('Conectado a Redis');

      if (password != null) {
        await _command.send_object(['AUTH', password]);
        print('Autenticado con Redis');
      }
    } catch (e) {
      print('Error al conectar a Redis: $e');
      _isConnected = false;
    }
  }

  Future<void> set(String key, String value) async {
    if (!_isConnected) {
      print('No estás conectado a Redis');
      return;
    }
    try {
      await _command.send_object(['SET', key, value]);
    } catch (e) {
      print('Error al establecer el valor en Redis: $e');
    }
  }

  Future<String?> get(String key) async {
    if (!_isConnected) {
      print('No estás conectado a Redis');
      return null;
    }
    try {
      return await _command.send_object(['GET', key]);
    } catch (e) {
      print('Error al obtener el valor de Redis: $e');
      return null;
    }
  }

  void close() {
    if (_isConnected) {
      print('Desconectado de Redis.');
      _connection.close();
      _isConnected = false;
    }
  }
}
