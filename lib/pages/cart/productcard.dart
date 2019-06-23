import 'package:belgium/constant/cart_item.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final CartItem product;
  final deleteItem;
  final modifyItem;
  int position;
  ProductCard(this.product, this.deleteItem, this.position, this.modifyItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.album),
              title: Text(this.product.name),
              subtitle: Text(this.product.quantity.toString()),
              trailing: Text(
                  (this.product.quantity * double.parse(this.product.price))
                      .toString())),
          ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                  onPressed: () {
                    this.modifyItem(position, 1);
                  },
                ),
                FlatButton(
                  child: Text(
                    'Substract',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onPressed: () {
                    this.modifyItem(position, 0);
                  },
                ),
                FlatButton(
                  child: Text(
                    'Delete Item',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onPressed: () {
                    this.deleteItem(position);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
