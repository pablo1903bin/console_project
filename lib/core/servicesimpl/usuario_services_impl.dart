import 'package:app/core/services/usuario_services.dart';
import 'package:app/core/models/UsuarioDTO.dart';
import 'package:app/core/repository/crear_usuario_repository.dart'
    as createusers;
import 'package:app/adapters/input/console_input_adapter.dart';
import 'package:app/utils/loading.dart' as mitimer;
import 'dart:io';

class UsuarioServiceImpl implements UserService {
  @override
  crearUsuario() async {
    UsuarioDTO userInput = ConsoleInputAdapter().llenarUsuario();
    try {
      await createusers.requestUsers(userInput);
      mitimer.Loading().cancel();
      stdout.write('\b');
    } catch (e) {
      mitimer.Loading().cancel();
      stdout.write('\b');
      print('\nError al crear el usuario: $e');
    }
  }
}
