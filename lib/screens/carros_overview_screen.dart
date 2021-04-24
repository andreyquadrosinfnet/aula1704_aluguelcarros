import 'package:app_aula1704_infnet/app_routes.dart';
import 'package:app_aula1704_infnet/components/carro_grid_item.dart';
import 'package:app_aula1704_infnet/mock/mock_object.dart';
import 'package:app_aula1704_infnet/models/carro.dart';
import 'package:app_aula1704_infnet/provider/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrosOverviewScreen extends StatefulWidget {

  @override
  _CarrosOverviewScreenState createState() => _CarrosOverviewScreenState();
}


class _CarrosOverviewScreenState extends State<CarrosOverviewScreen> {
  final List<Carro> carros = MOCK_CARROS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RentCars - Aluguel de Carros'),
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
      body: GridView.builder(
          itemCount: carros.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index){
          return CarroGridItem(carros[index]);
          },
      ),
    );
  }
}
