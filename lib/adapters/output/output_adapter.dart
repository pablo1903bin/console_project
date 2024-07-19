import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class OutputConsoleAdapter {
  void msjUsuarioCreado(http.Response response) {
    stdout.writeln();
    stdout.writeln();
    print('       SE CREO USUARIO CORRECTAMENTE       ');
    stdout.writeln();
    var responseBody = jsonDecode(response.body);
    // Acceder a los campos del JSON
    var username = responseBody['username'];
    var email = responseBody['email'];
    print('       Username: $username');
    print('       Email: $email');
    stdout.writeln();
    stdout.writeln();
    print("****************************************************");
  }

  void usuarioNoCreado(http.Response response) {
    stdout.writeln();
    stdout.writeln();
    print('USUARIO O CORREO NO ESTAN DISPONIBLES');
  }

  static void msjSalida(String msj) {
    print(msj);
  }
}
