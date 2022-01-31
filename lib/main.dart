import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/details_product_screen.dart';

import 'screens/overview_product_screen_.dart';

void main() => runApp( MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductsProvider(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        home:  OverviewProductScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          DetailsProductScreen.routeName : (ctx) => DetailsProductScreen(),
        },
      ),
    );
  }
}
