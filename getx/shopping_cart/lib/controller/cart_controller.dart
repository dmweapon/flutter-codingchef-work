import 'package:get/get.dart';
import 'package:shopping_cart/model/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  //int totalPrice = cartItems.fold(0, (e, item) => e + item.price);
  int get totalPrice => cartItems.fold(0, (e, item) => e + item.price);
  int get count => cartItems.length;

  void addToItem(Product product) {
    cartItems.add(product);
  }
}
