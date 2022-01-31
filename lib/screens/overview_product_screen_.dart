import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/product_item.dart';

class OverviewProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<ProductsProvider>(context);
    final productsList = productsData.item;

    return Scaffold(

      appBar: AppBar(
        title: Text('MyShop'),
      ),

      body: GridView.builder(
        itemCount: productsList.length,

        // emta astakhdem create: w emta changeNotifierProvider.value ?
        // law 3amla wrap 3la screen zai fl main.dart b7ot el create law 3la widget f screen zai grid b7ot .value
        // tab leh ? 3lshan el .value bt3mel rebuild lel wrapped widget 3alatol gher el create provider did'nt keep up with alot of changes in the data
        // w msh hyenfa3 astakhdem daimn .value 3lshan da hystahlek memory eni a3mel kol showaia rebuild
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: productsList[i],
          // create: (c) => productsList[i],
          child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
          ),
        ),

        padding: EdgeInsets.all(10.0),

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          maxCrossAxisExtent: 300,
          childAspectRatio: 1.4,
        ),
      ),
    );
  }
}
