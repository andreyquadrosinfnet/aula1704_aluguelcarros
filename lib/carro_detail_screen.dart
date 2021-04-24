import 'package:app_aula1704_infnet/provider/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:app_aula1704_infnet/models/carro.dart';
import 'package:provider/provider.dart';

import 'app_routes.dart';

class CarroDetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    final Carro carro = ModalRoute.of(context).settings.arguments as Carro;
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.modelo),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.of(context)
                  .pushNamed(AppRoutes.CART_DETAIL);
            },
          ),
          Consumer<CartItem>(
              builder: (context, cartItem, _) => Text(cartItem.total.toString())),
          SizedBox(width: 18,)
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: Column(
            children: [
              Image.network(carro.imagemUrl),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Carro Selecionado: ' +carro.modelo,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,

                ),),
              ),
              Text('Marca: ' +carro.marca,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,

                ),),
              Text('Placa: ' +carro.placa,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,

                ),),
              Text('Valor da diária: R\$ ' +carro.valor.toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ElevatedButton(
                    onPressed: (){
                      cartProvider.addCarro(carro);
                      Navigator.of(context).pushNamed(
                          AppRoutes.CART_DETAIL,
                          arguments: carro,
                      );
                    },
                    child: Text('Alugar ' + carro.modelo)),
              )

            ],

          ),
        ),

      )
    );
  }
}
