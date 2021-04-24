import 'package:app_aula1704_infnet/provider/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RentOverview extends StatelessWidget {
  // final double valorTotal;
  //
  // RentOverview(this.valorTotal);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text('##'),
        title: Consumer<CartItem>(
            builder: (context, cartItem, _) {
              return Text('R\$ ${cartItem.valorTotal.toStringAsFixed(2)}');
            }
        ),
        subtitle: Text('Total a pagar'),
        // trailing: Column(
        //   children: [
        //     Icon(Icons.arrow_circle_up),
        //     Icon(Icons.arrow_circle_down),
        //   ],
        // ),
      ),
    );
  }
}