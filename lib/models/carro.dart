import 'package:flutter/material.dart';

class Carro with ChangeNotifier {

  final int id;
  final String marca;
  final String modelo;
  final String placa;
  final String imagemUrl;
  final double valor;
  int diaria;

  Carro({
    @required this.id,
    @required this.marca,
    @required this.modelo,
    @required this.placa,
    @required this.imagemUrl,
    @required this.valor,
    diaria = 0,
  });

  void updateDiaria() {
    diaria++;
  }

}