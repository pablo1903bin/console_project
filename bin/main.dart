import 'package:app/Dtos/UsuarioDTO.dart';
import 'package:app/poo/crear_usuario.dart' as createusers;
import 'dart:async';
import 'dart:io';

void main(List<String> args) async {
  stdout.write('Ingrese su nombre: ');
  String nombre = stdin.readLineSync() ?? '';

  stdout.write('Ingrese su contraseña: ');
  String password = stdin.readLineSync() ?? '';

  stdout.write('Ingrese un nombre de usuario: ');
  String username = stdin.readLineSync() ?? '';

  stdout.write('Ingrese su correo electrónico: ');
  String email = stdin.readLineSync() ?? '';

  var usuario = UsuarioDTO(
    nombre: nombre,
    password: password,
    username: username,
    apellido: "Apellido X",
    telefono: "5543675402",
    email: email,
  );

  // Simulando una carga con un indicador animado
  var indicador = ['|', '/', '-', '\\'];
  int i = 0;
  var timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
    stdout.write('\b${indicador[i]}');
    i = (i + 1) % indicador.length;
  });

  try {
    // Simula una operación asincrónica, como crear un usuario
    await Future.delayed(Duration(seconds: 3));
    // Lógica para crear el usuario
    await createusers.crearUsuarios(usuario);

    // Detener el indicador
    timer.cancel();
    stdout.write('\b'); // Borrar el último caracter del indicador

    print('\nUsuario creado exitosamente.');
  } catch (e) {
    // En caso de error, también detener el indicador y mostrar mensaje de error
    timer.cancel();
    stdout.write('\b'); // Borrar el último caracter del indicador
    print('\nError al crear el usuario: $e');
  }
}

//  await createusers.crearUsuarios(usuario);

