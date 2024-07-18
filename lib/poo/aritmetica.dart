// Definición de la clase Aritmetica
class aritmetica {
  // Método para sumar dos números
  int sumar(int a, int b) {
    return a + b;
  }

  // Método para restar dos números
  int restar(int a, int b) {
    return a - b;
  }

  // Método para multiplicar dos números
  int multiplicar(int a, int b) {
    return a * b;
  }

  // Método para dividir dos números
  double dividir(int a, int b) {
    // Verificar si el divisor no es cero
    if (b == 0) {
      throw ArgumentError("El divisor no puede ser cero");
    }
    return a / b;
  }
}
