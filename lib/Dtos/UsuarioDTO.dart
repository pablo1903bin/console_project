// ignore: file_names
class UsuarioDTO {
  final String username;
  final String password;
  final String nombre;
  final String apellido;
  final String telefono;
  final String email;

  UsuarioDTO({
    required this.nombre,
    required this.password,
    required this.username,
    required this.apellido,
    required this.telefono,
    required this.email,
  });

  // Método toJson para convertir UsuarioDTO a JSON
  Map<String, dynamic> toJson() {
    return {
      'name': nombre,
      'password': password,
      'username': username,
      'apellido': apellido,
      'telefono': telefono,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'UsuarioDTO { nombre: $nombre, password: $password, username: $username, apellido: $apellido, telefono: $telefono, email: $email }';
  }
}
