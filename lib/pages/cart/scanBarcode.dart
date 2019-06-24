import 'dart:convert';

import 'package:belgium/constant/cart_item.dart';
import 'package:belgium/constant/menu.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class ScanBarcode extends StatelessWidget {
  var statechanger;

  ScanBarcode(this.statechanger);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
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
            "Add new item to the cart",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  Future scan() async {
    String result;
    try {
      result = await BarcodeScanner.scan();
      Menu menu = new Menu();
      var dict = menu.returnMenu();
      var _list = dict.values.toList();
      

      this.statechanger(CartItem("Begin Shopping", "000000", "23", 0));
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
}
