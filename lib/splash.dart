import 'package:app_aula1704_infnet/app_routes.dart';
import 'package:app_aula1704_infnet/carro_detail_screen.dart';
import 'package:app_aula1704_infnet/provider/cart_item.dart';
import 'package:app_aula1704_infnet/screens/carros_overview_screen.dart';
import 'package:app_aula1704_infnet/screens/cart_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartItem(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Aluguel de Carros',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: CarrosOverviewScreen(),
        routes: {
          AppRoutes.CARRO_DETAIL: (context) =>CarroDetailScreen(),
          AppRoutes.CART_DETAIL: (context) => CartDetailScreen(),
        },
      ),
    );
  }
}


