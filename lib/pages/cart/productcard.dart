import 'package:belgium/constant/cart_item.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  CartItem product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.album),
              title: Text(this.product.barcode),
              subtitle: Text(this.product.price),
              trailing: Text(this.product.quantity.toString())),
          ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Delete Item',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onPressed: () {
                    // deleteItem(position);
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
