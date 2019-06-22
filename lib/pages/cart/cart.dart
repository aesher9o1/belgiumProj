import 'package:belgium/constant/cart_item.dart';
import 'package:belgium/pages/cart/items.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  String bagId;
  List<String> _product = [];

  CartPage(String this.bagId);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text("Welcome " + bagId,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Nunito',
                      fontSize: 21,
                      fontWeight: FontWeight.w700)),
            ),
            Expanded(child: Item(CartItem("Begin Shopping", "000000", "23", 0)))
          ],
        ),
      )),
    );
  }
}
