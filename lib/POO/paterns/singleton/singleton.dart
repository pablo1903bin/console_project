class Singleton {
  // Declarar una instancia estática privada de la clase
  static final Singleton _instance = Singleton._internal();

  // Constructor privado
  Singleton._internal();

  // Método factory que retorna la instancia única
  factory Singleton() {
    return _instance;
  }

  // Ejemplo de un método que se puede llamar en la instancia singleton
  void doSomething() {
    print('Haciendo algo con el singleton');
  }
}
