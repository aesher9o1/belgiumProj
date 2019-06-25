import 'package:belgium/constant/cart_item.dart';
import 'package:belgium/pages/cart/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillPage extends StatelessWidget{
  final List<CartItem> _product = <CartItem>[];
  double billAmount;
  double uniHeight;
  double uniWidth;
  double available = CartPage.finalAmount;

  BillPage(_product, billAmount);

  @override
  Widget build(BuildContext context) {
    var uniHeight = MediaQuery.of(context).size.height;
    var uniWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: uniHeight / 0.1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: uniHeight / 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: uniWidth / 50)),
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  Padding(padding: EdgeInsets.only(left: uniWidth / 5)),
                  Text(
                    'Your Receipt',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: uniWidth / 18),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: uniHeight / 30)),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: uniWidth / 1.23,
                  height: uniHeight / 1.7,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey[200],
                        spreadRadius: 3.0,
                        blurRadius: 3.0)
                  ]),
                  child: Column(
                    children: transaction(),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: uniHeight / 20)),
              Padding(padding: EdgeInsets.only(top: uniHeight / 50)),
              Padding(
                padding:
                EdgeInsets.only(left: uniWidth / 10, right: uniWidth / 20),
                child: Text(
                  "Take Screenshot of this receipt and show it at the counter!",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: uniWidth / 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> transaction(){
      List<Widget> widlist = new List<Widget>();
      for(var i =0; i < _product.length; i++){
        widlist.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Text(_product[i].name, style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Nunito',
              fontSize: 13,
              fontWeight: FontWeight.w400
          )
          ),
          Text(_product[i].price,
             style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Nunito',
                  fontSize: 13,
                  fontWeight: FontWeight.w400
              ))
        ],));

      }
      return widlist;
   
  }


}