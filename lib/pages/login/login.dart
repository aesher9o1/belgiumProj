import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("login.jpg"), fit: BoxFit.fill),
        ),
        child: new Column(
          children: <Widget>[
            new Center(
                child: Container(
              child: Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[Text("Login")],
                ),
              ),
            ))
          ],
        ));
  }
}
