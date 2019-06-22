import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_utils/qr_utils.dart';
import 'dart:async';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage("login.jpg"), fit: BoxFit.fill),
      )),
      Center(
        child:
          Padding(
            padding: EdgeInsets.all(29),
            child: Container(
            height: 200,
            child: Card(
                child: Container(
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Login",
                    style: new TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 21,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    child: RaisedButton(
                      elevation: 4,
                      color: Colors.black,
                      textColor: Colors.white,
                      splashColor: Colors.blueGrey,
                      onPressed: scan,
                      child: Text('Begin Shopping', style : new TextStyle(
                        fontFamily: 'Nunito',

                      ),),
                    ),
                  )
                ],
              ),
            ))),
          )
         ,
      ),
    ]);
  }
}


Future scan() async{
   String result;
    try {
      result = await QrUtils.scanQR;
      print(result);
    } on PlatformException {
      result = 'Process Failed!';
    }
}