import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavourite;

  Product({
    @required this.id, @required this.title, @required this.description, @required this.imageUrl, @required this.price, this.isFavourite = false,
});

  void isFavouriteStatus(){
    isFavourite = !isFavourite;  // ???
    notifyListeners(); // same as setstate in stateful and emit in bloc
  }

}