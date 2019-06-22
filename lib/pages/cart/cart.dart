import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {

  String bagId;

  CartPage(String this.bagId){}
  @override
  Widget build(BuildContext context) {
    return Text(bagId);
  }
}
