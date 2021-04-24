import 'package:app_aula1704_infnet/app_routes.dart';
import 'package:app_aula1704_infnet/models/carro.dart';
import 'package:app_aula1704_infnet/provider/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarroGridItem extends StatelessWidget {

  final Carro carro;

  CarroGridItem(this.carro);


  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    return GridTile(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(
            AppRoutes.CARRO_DETAIL,
            arguments: carro,
          );
        },
        child: Image.network(
          carro.imagemUrl,
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          carro.modelo + '-' + carro.marca,
        ),
        trailing: IconButton(
          icon: Icon(Icons.car_rental),
          onPressed: (){
            cartProvider.addCarro(carro);
            print(cartProvider.total);
         }
        ),
        subtitle: Text(
          'R\$' + carro.valor.toString() + ' /dia'
        ),

      ),
    );
  }
}
