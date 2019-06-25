import 'dart:convert';

import 'package:belgium/constant/cart_item.dart';
import 'package:belgium/constant/menu.dart';
import 'package:belgium/pages/bill/billing.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:path/path.dart';

class ScanBarcode extends StatelessWidget {
  var statechanger;
  final List<CartItem> _product = <CartItem>[];
  var gcontext;

  ScanBarcode(this.statechanger, _product);

  @override
  Widget build(BuildContext context) {
    this.gcontext = this;

    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: scan,
            color: Colors.black,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: null,
                ),
                Text(
                  "Add item ",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: checkout,
            color: Colors.greenAccent,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: null,
                ),
                Text(
                  "Checkout ",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Future scan() async {
    String result;
    try {
      result = await BarcodeScanner.scan();
      Menu menu = new Menu();
      Map<String, dynamic> finalMenu = menu.menu;
      result = result.replaceAll(new RegExp(r"\s+\b|\b\s"), '');

      if (finalMenu.containsKey(result))
        this.statechanger(CartItem(
            finalMenu[result]['name'], result, finalMenu[result]['price'], 1));

      // this.statechanger(CartItem("Begin Shopping", "000000", "23", 0));
      // result = result.replaceAll(new RegExp(r"\s+\b|\b\s"), '');
      // print(jsonDecode(Menu().returnMenu()));
      // if (jsonDecode(Menu().returnMenu())['result']) {
      //   this.statechanger(CartItem("Begin Shopping", "000000", "23", 0));
      // } else {
      //   this.statechanger(CartItem("Begin Shopping", "000000", "23", 0));
      // }

      // this.statechanger(result);
    } on PlatformException {
      result = 'Process Failed!';
    }
  }

  void checkout() {
    double billAmount = 0.0;
    var len = _product.length;
    for (var i = 0; i < len; i++) 
      billAmount += double.parse(_product[i].price);
    
    Navigator.push(
        gcontext,
        MaterialPageRoute(
            builder: (context) => BillPage(_product, billAmount)));
  }
}
