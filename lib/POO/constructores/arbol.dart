class Arbol {
  String? tipo;
  String? color;
  double? altura;
  bool? _frutal;

  Arbol();

  Arbol.inicializador(String tipo, String color, double altura, bool esFrutal) {
    this.tipo = tipo;
    this.color = color;
    this.altura = altura;
    this._frutal = esFrutal;
  }

  set tipoAr(String tipoAr) {
    tipo = tipoAr;
  }

  String? get colorAr => color;

  set frutal(bool frutasl) {
    _frutal = frutasl;
  }

  bool? get esFrutal => _frutal;

  @override
  String toString() {
    String? frutal = '';
    if (_frutal == null) {
      frutal = null;
    } else if (_frutal == false) {
      frutal = 'No da fruta';
    } else {
      frutal = 'Si da fruta';
    }
    return 'Tipo: $tipo, Color: $color, Altura: $altura, Es frutal: $frutal';
  }
}
