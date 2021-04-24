import 'package:app_aula1704_infnet/models/carro.dart';
import 'package:flutter/material.dart';

// uma classe mixin ela pode ser combinada com outra usando 'with'

class CartItem with ChangeNotifier {
  List<Map<String, Object>> _carros = [];

  List<Map<String, Object>> get carros => [..._carros];

  int get total => _carros.length;

  int countItem(Carro carro){
    int count = 0;
    _carros.forEach((element) {
      if (element.containsValue(carro)) {
        count = element['diaria'] as int;
      }
    });
    return count;
  }

  double get valorTotal {
    double total = 0;
    _carros.forEach((carroMap) {
      var carro = carroMap['carro'] as Carro;
      total += carro.valor * carroMap['diaria'];
    });
    return total;
  }

  void updateDiaria(Carro carro, {bool add = true}) {
    int i = 0;
    bool update = false;
    for (; i < _carros.length; i++) {
      if (_carros[i].containsValue(carro)) {
        update = true;
        break;
      }
    }
    if (update){
      var diaria = _carros[i]['diaria'] as int;
      diaria += (add ? 1 : -1);
      if (diaria >= 1) {
        _carros[i]['diaria'] = diaria;
      } else {
        _carros.removeAt(i);
      }
      notifyListeners();
    }
  }

  void addCarro(Carro carro) {
    bool add = true;
    _carros.forEach((element) {
      if (element.containsValue(carro)) {
        add = false;
      }
    });
    if (add) {
      _carros.add({'carro': carro, 'diaria': 1});
      notifyListeners();
    }
  }
}