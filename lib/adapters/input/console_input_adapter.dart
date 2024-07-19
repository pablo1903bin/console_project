import 'package:app/core/models/UsuarioDTO.dart';
import 'dart:io';

class ConsoleInputAdapter {
  UsuarioDTO llenarUsuario() {
    print("______________________________________________________________");
    stdout.write('     CREAR USUARIO    ');
    stdout.writeln();
    stdout.write('  Ingrese su nombre: ');
    String nombre = stdin.readLineSync() ?? '';

    stdout.write('  Ingrese su contraseña: ');
    String password = stdin.readLineSync() ?? '';

    var usuario = UsuarioDTO(
      nombre: nombre,
      password: password,
      username: nombre,
      apellido: "Apellido Y",
      telefono: "5543675402",
      email: '$nombre@gmail.com',
    );
    stdout.writeln();
    stdout.write('Espere... ');
    return usuario;
  }
}
