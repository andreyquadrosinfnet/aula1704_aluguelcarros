import 'package:app_aula1704_infnet/components/rent_list_item.dart';
import 'package:app_aula1704_infnet/components/rent_overview.dart';
import 'package:app_aula1704_infnet/provider/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CartDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartItem cartItem = Provider.of<CartItem>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Aluguel'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          RentOverview(),
          Consumer<CartItem>(
            builder: (context, cartItem, _) => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: cartItem.total,
                itemBuilder: (context, index) {
                  return RentListItem(cartItem.carros[index]);
                  // { carro, diária }
                }),
          ),
          //...cartItem.carros.map((carro) => Text(carro.modelo)).toList(),
        ]),
      ),
    );
  }
}