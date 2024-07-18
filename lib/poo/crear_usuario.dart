import 'dart:convert';
import 'package:app/Dtos/UsuarioDTO.dart';
import 'package:http/http.dart' as http;

Future<void> crearUsuarios(UsuarioDTO usr) async {
  var url =
      Uri.parse('http://45.33.13.164//gateway/api/authentication/sign-up');

  // Convertir el objeto a JSON
  var usrJson = usr.toJson();

  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(usrJson), // Convertir el mapa a JSON
    );

    // Esperar a que la solicitud HTTP se complete y obtener el objeto Response
    if (response.statusCode == 201) {
      print('Solicitud exitosa:');
      print('Cuerpo de la respuesta: ${response.body}');
    } else {
      print('Error en la solicitud:');
      print('Código de estado: ${response.statusCode}');
      print('Mensaje: ${response.body}');
    }
  } catch (e) {
    print('Excepción al hacer la solicitud: $e');
  }
}
