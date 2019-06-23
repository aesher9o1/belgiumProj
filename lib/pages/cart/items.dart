import 'package:belgium/constant/cart_item.dart';
import 'package:belgium/pages/cart/productcard.dart';
import 'package:belgium/pages/cart/scanBarcode.dart';
import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  CartItem initItem;
  Item(this.initItem);

  _ItemState createState() => new _ItemState();
}

class _ItemState extends State<Item> {
  final List<CartItem> _product =<CartItem>[];

  @override
  void initState() {
    this._product.add(widget.initItem);
    super.initState();
  }

  void stateUpdate(product) {
    setState(() {
      this._product.add(product);
    });
  }

  void deleteItem(index) {
    setState(() {
      this._product.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, int position) {
            return ProductCard(_product[position], this.deleteItem, position);
          },
          itemCount: _product.length,
        )),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[ScanBarcode(stateUpdate)],
        ),
      ],
    );
  }
}
