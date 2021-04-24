import 'package:app_aula1704_infnet/models/carro.dart';
import 'package:app_aula1704_infnet/provider/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RentListItem extends StatelessWidget {
  final Map<String, Object> carroItem;
  RentListItem(this.carroItem);

  @override
  Widget build(BuildContext context) {
    final CartItem cartItem = Provider.of<CartItem>(context);
    var carro = carroItem['carro'] as Carro;

    return ListTile(
      leading: Consumer<CartItem>(builder: (context, cartItem, _) {
        return IconButton(
          onPressed: () {
            cartItem.updateDiaria(carro, add: false);
          },
          icon: cartItem.countItem(carro) == 1
              ? Icon(Icons.delete,
            color: Theme.of(context).accentColor,)
              : Icon(
            Icons.arrow_left_outlined,
            color: Theme.of(context).primaryColor,
          ),
        );
      }),
      title: Text("${carro.modelo} (${carro.marca})"),
      subtitle: Consumer<CartItem>(
          builder: (context, cartItem, _) =>
              Text("Diárias: ${cartItem.countItem(carro)}")),
      trailing: IconButton(
        icon: Icon(Icons.arrow_right_outlined),
        onPressed: () {
          cartItem.updateDiaria(carro);
        },
      ),
    );
  }
}