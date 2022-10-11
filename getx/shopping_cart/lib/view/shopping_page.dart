import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controller/cart_controller.dart';
import 'package:shopping_cart/controller/shopping_controller.dart';
import 'package:intl/intl.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  var f = NumberFormat.currency(locale: "ko_KR", symbol: "￦");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Scrollbar(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(12),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(controller
                                        .products[index].productDescription),
                                  ],
                                ),
                                Text(
                                  f.format(controller.products[index].price),
                                  style: TextStyle(fontSize: 24),
                                )
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController
                                    .addToItem(controller.products[index]);
                              },
                              child: Text('Add to Cart'),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            SizedBox(
              height: 30,
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                '총 금액 : ${f.format(controller.totalPrice)}',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              );
            }),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text(
            '${controller.count}개 상품 결제하기',
            style: TextStyle(
              fontSize: 20,
            ),
          );
        }),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
