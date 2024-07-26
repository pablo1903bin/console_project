/*Crea una clase Auto con los atributos nombre y edad. Define un constructor que inicialice estos atributos.*/
class Auto {
  String? _color;
  String? _modelo;
  int? _anio;

  Auto();

  Auto.inicialicer(String color, String modelo, int anio) {
    _color = color;
    _modelo = modelo;
    _anio = anio;
  }

  set color(String color) {
    _color = color;
  }

  String? getColor() => _color;

  @override
  String toString() {
    return "Color: $_color, Modelo: $_modelo, Año: $_anio";
  }
}
