import 'dart:async';
import 'dart:io';

// ignore: non_constant_identifier_names
Timer Loading() {
  // Simulando una carga con un indicador animado
  var indicador = ['|', '/', '-', '\\'];
  int i = 0;
  var timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
    stdout.write('\b${indicador[i]}');
    i = (i + 1) % indicador.length;
  });

  return timer;
}
