class Casa {
  String? _color;
  int? _plantas;
  double? _m2;

  Casa();

  Casa.inicializador(String color, int plantas, double m2s) {
    _color = color;
    _plantas = plantas;
    _m2 = m2s;
  }

  String? getColor() => _color;

  int? getPlantas() {
    return _plantas;
  }

  double? getM2() => _m2;

  void setColor(String color) {
    _color = color;
  }

  void setPlantas(int plantas) {
    _plantas = plantas;
  }

  void setM2(double m2s) {
    _m2 = m2s;
  }

  @override
  String toString() {
    return "Color: $_color, Plantas: $_plantas, M2: $_m2";
  }
}
