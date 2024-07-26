class Cadena {
  static revertiCadena(String cadena) {
    String nuevCadeInv = '';
    for (var i = cadena.length - 1; i >= 0; i--) {
      nuevCadeInv += cadena[i];
    }
    return nuevCadeInv;
  }

  static bool esPalindromoFunctional(String texto) {
    String invertido = texto.split('').reversed.join('');
    return texto == invertido;
  }

  static bool esPalindromo(String cad) {
    String miCadInv = revertiCadena(cad);
    if (cad == miCadInv) {
      return true;
    } else {
      return false;
    }
  }
}
