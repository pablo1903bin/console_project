import 'dart:convert';
import 'dart:io';
import 'package:app/core/models/UsuarioDTO.dart';
import 'package:app/adapters/output/output_adapter.dart';
import 'package:app/core/repository/redis_client.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';

Future<void> requestUsers(UsuarioDTO usr) async {
  String urlApiCreteUsers = Config.apiUrlSignUp;
  var url = Uri.parse(urlApiCreteUsers);
  var usrJson = usr.toJson();
  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(usrJson),
    );
    OutputConsoleAdapter imprimirRespuesta = OutputConsoleAdapter();
    if (response.statusCode == 201) {
      var responseBody = jsonDecode(response.body);
      var token = responseBody['token'];
      var id = responseBody['id'];
      stdout.writeln();
      print("Token:  $token");

      final redisService = await RedisService.getInstance(password: 'super');

      await redisService.set('user:$id:token', token);
      final retrievedToken = await redisService.get('user:$id:token');
      if (retrievedToken != null) {
        print('Token recuperado: $retrievedToken');
      } else {
        print('Token no encontrado. El usuario puede no estar autenticado.');
      }
      redisService.close();
      imprimirRespuesta.msjUsuarioCreado(response);
    } else {
      if (response.statusCode == 409) {
        imprimirRespuesta.usuarioNoCreado(response);
      }
      OutputConsoleAdapter.msjSalida(
          "INTENTE NUEVAMENTE CON UN NUEVO USUARIO O CORREO");
    }
  } catch (e) {
    print('Excepción al hacer la solicitud: $e');
  }
}
