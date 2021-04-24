import 'package:app_aula1704_infnet/models/carro.dart';
import 'package:flutter/material.dart';


// CartProvider.of()
//Envolve MaterialAPp para acessar toda a arvore

class CartProvider extends InheritedWidget {


  CartProvider({Widget child}): super(child:child);

  // Retornar uma instancia de CartProvider que já foi instanciada no contexto
  // em que ele for solicitado.
  static CartProvider of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CartProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}