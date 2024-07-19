import 'package:app/core/servicesimpl/usuario_services_impl.dart';

void main(List<String> args) async {
  UsuarioServiceImpl userService = UsuarioServiceImpl();
  userService.crearUsuario();
}
