import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

class DetailsProductScreen extends StatelessWidget {
  static const routeName = 'Screens/details_product_screen';
  @override
  Widget build(BuildContext context) {
    String productID = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<ProductsProvider>(context, listen: false).findbById(productID);   //listen: false 3lshan law 7sal ay update fl data msh 3aiz el screen di tt3mlha rebuild
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title),),
    );
  }
}