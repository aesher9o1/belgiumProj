import 'package:belgium/constant/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillPage extends StatelessWidget{
  final List<CartItem> _product = <CartItem>[];
  double billAmount;
  BillPage(_product, billAmount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Text("data")
          ],
        ),
      ),
    )
  }


}