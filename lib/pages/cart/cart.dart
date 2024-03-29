import 'package:belgium/constant/cart_item.dart';
import 'package:belgium/pages/cart/items.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  String bagId;
  List<String> _product = [];
  double amount1 = 50.0;
  double amount2 = 1.0;
  static double finalAmount;
  CartPage(String this.bagId);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Welcome " + bagId,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Nunito',
                          fontSize: 21,
                          fontWeight: FontWeight.w700),
                    ),
                    Expanded(
                      child: Text(''),
                    ),
                    
                    Text("Amount available - "+amount(bagId).toString(),style: TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'Nunito',
                      fontSize: 13,
                      fontWeight: FontWeight.w700
                    ),)
                  ],
                ),
                ),
            Expanded(child: Item(null)),
          ],
        ),
      )),
    );
  }

  double amount(String bagId) {
    if (bagId == "Bag 01") {
      finalAmount =  amount1;
    } else {
      finalAmount =  amount2;
    }
    return finalAmount;
  }
}
