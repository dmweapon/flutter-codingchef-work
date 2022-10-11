import 'package:get/get.dart';
import 'package:shopping_cart/model/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    var productData = [
      Product(
          id: 1,
          productName: '제품명1',
          productDescription: '제품명1에 대한 제품설명',
          price: 30000),
      Product(
          id: 2,
          productName: '제품명2',
          productDescription: '제품명2에 대한 제품설명',
          price: 40000),
      Product(
          id: 3,
          productName: '제품명3',
          productDescription: '제품명3에 대한 제품설명',
          price: 125000),
      Product(
          id: 4,
          productName: '제품명4',
          productDescription: '제품명4에 대한 제품설명',
          price: 421000),
      Product(
          id: 5,
          productName: '제품명5',
          productDescription: '제품명5에 대한 제품설명',
          price: 65000),
    ];

    products.assignAll(productData);
  }
}
