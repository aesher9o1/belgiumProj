import 'package:flutter/material.dart';

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
        child: Container(
            height: 200,
            child: Card(
                child: Container(
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Text(
                      "Have an existing bag code?",
                      style: new TextStyle(fontFamily: 'Nunito'),
                    ),
                  )
                ],
              ),
            ))),
      ),
    ]);
  }
}
