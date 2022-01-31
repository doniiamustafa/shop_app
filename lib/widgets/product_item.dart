import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_model.dart';
import 'package:shop_app/screens/details_product_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageURL;
  //
  // ProductItem(this.id, this.title, this.imageURL);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,listen: false);    // 3amlt object mn el Product class bakhod meno ai 7aga
    //leh 7atet listen:false? 3lshan ana 3andi consumer ta7t 3la el fav.iconbutton by3mel listen&rebuild 3la el button bs msh 3iza y3mel listen 3la el screen kolha

    print('screen rebuild');
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(DetailsProductScreen.routeName, arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            title: Text(
              product.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
            ),
            backgroundColor: Colors.black87,

            //eh el child eli fl consumer? da 3lshan law fi 7aga fl IconButton msh 3iza yt3mlha rebuild ha7otha fl child di for ex: label:child w akon m3rfa el label bara
            leading: Consumer<Product>(builder: (ctx, product, child) => IconButton(
              icon: Icon(product.isFavourite? Icons.favorite : Icons.favorite_outline, color: Theme.of(context).accentColor),
              onPressed: () {
                product.isFavouriteStatus();
              },
            ),),
            trailing: IconButton(
              icon:
                  Icon(Icons.shopping_cart, color: Theme.of(context).accentColor),
              onPressed: () {},
            ),
          ),
        ),
      );

  }
}
