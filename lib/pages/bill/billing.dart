import 'package:belgium/constant/cart_item.dart';
import 'package:belgium/pages/cart/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:toast/toast.dart';

class BillPage extends StatefulWidget{
  final List<CartItem> _product;
  double billAmount;

  BillPage(this._product, this.billAmount);

  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  double uniHeight;

  double uniWidth;

  double available = CartPage.finalAmount;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget._product);
  }
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
                  child: Padding(
                    padding: EdgeInsets.all(uniWidth/7),
                    child: Column(
                    children: transaction(),
                  ),
                )
                ),
              ),
              Padding(padding: EdgeInsets.only(top: uniHeight / 20)),
              Padding(padding: EdgeInsets.only(top: uniHeight / 50)),
              Padding(
                padding:
                EdgeInsets.only(left: uniWidth / 10, right: uniWidth / 20),
                child: GestureDetector(
                  onTap: something,
                    child: Text(
                  "",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: uniWidth / 20),
                )
              ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> transaction(){
      if(widget.billAmount < available) {
        List<Widget> widlist = new List<Widget>();
        widlist.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Item", style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Nunito',
                    fontSize: 13,
                    fontWeight: FontWeight.w400
                )
                ),
                Text("Price",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                        fontSize: 13,
                        fontWeight: FontWeight.w400
                    ))
              ],
            )
        );
        for (var i = 0; i < widget._product.length; i++) {
          widlist.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget._product[i].name, style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Nunito',
                  fontSize: 13,
                  fontWeight: FontWeight.w400
              )
              ),
              Text(widget._product[i].price,
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Nunito',
                      fontSize: 13,
                      fontWeight: FontWeight.w400
                  ))
            ],
          )
          );

        }
        widlist.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Total", style: TextStyle(
                color: Colors.black,
                fontFamily: 'Nunito',
                fontSize: 13,
                fontWeight: FontWeight.w400
            )
            ),
            Text(widget.billAmount.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Nunito',
                    fontSize: 13,
                    fontWeight: FontWeight.w400
                ))
          ],
        )
        );
        widlist.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Balance Left", style: TextStyle(
                color: Colors.black,
                fontFamily: 'Nunito',
                fontSize: 13,
                fontWeight: FontWeight.w400
            )
            ),
            Text((available - widget.billAmount).toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Nunito',
                    fontSize: 13,
                    fontWeight: FontWeight.w400
                ))
          ],
        )
        );
        return widlist;
      }
      else{
        List<Widget> widlist = new List<Widget>();
        widlist.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text("Transaction Falied",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ))
              ],
            )
        );

      }
  }

  void something(){
    print(widget._product);
  }
}