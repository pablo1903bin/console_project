import 'dart:convert';
import 'package:app/core/auth/token_manager.dart';
import 'package:app/core/models/UsuarioDTO.dart';
import 'package:app/config.dart' as api;
import 'package:app/adapters/output/output_adapter.dart';

import 'package:http/http.dart' as http;

Future<void> crearUsuarios(UsuarioDTO usr) async {
  String urlApiCreteUsers = api.Config.apiUrlSignUp;
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
      TokenManager().setToken(token);
      imprimirRespuesta.msjUsuarioCreado(response);
    } else {
      if (response.statusCode == 409) {
        imprimirRespuesta.usuarioNoCreado(response);
      }
      print("INTENTE NUEVAMENTE CON UN NUEVO USUARIO O CORREO");
    }
  } catch (e) {
    print('Excepción al hacer la solicitud: $e');
  }
}
