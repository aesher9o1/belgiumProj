import 'package:belgium/pages/cart/scanBarcode.dart';
import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  String initItem;
  Item(this.initItem);

  _ItemState createState() => new _ItemState();
}

class _ItemState extends State<Item> {
  List<String> _product = [];

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
          itemBuilder: (context, position) {
            return Card(
              child: Column(
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('The name of the item'),
                    subtitle: Text("The price:"),
                    trailing: Text("Quantity"),
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text(
                            'Delete Item',
                            style: TextStyle(color: Colors.redAccent),
                          ),
                          onPressed: () {
                            deleteItem(position);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
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
