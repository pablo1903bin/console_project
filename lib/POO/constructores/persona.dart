class Persona {
  String? nombre;
  String? apellidos;
  int? edad;
  String? correo;
  List<String>? amigos;

  // Constructor vacío
  Persona();

  // Constructor con parámetros
  Persona.conParametros(
      this.nombre, this.apellidos, this.edad, this.correo, this.amigos);

  // Método para obtener la lista de amigos
  List<String>? obtenerAmigos() {
    return amigos;
  }
}
