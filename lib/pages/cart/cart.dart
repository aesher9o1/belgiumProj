import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter_adaptive_cards/flutter_adaptive_cards.dart';

class CartPage extends StatelessWidget {
  String bagId;

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
            Expanded(
              child: Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.album),
                        title: Text('The name of the item'),
                        subtitle: Text("The price:"),
                        trailing: Text("Quantity"),
                      ),
                      ButtonTheme.bar( // make buttons use the appropriate styles for cards
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('Delete Item', style: TextStyle(color: Colors.redAccent),),
                              onPressed: () { /* ... */ },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  onPressed: ()=>{},
                  color: Colors.black,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.shopping_cart, color: Colors.white,),
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
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}


//   Future scan() async{
//    String result;
//     try {
     
//       result= await FlutterBarcodeScanner.scanBarcode("#010101","Cancel",false);
      
//     } on PlatformException {
//       result = 'Process Failed!';
//     }
// }