import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool VisibilityB = true;
  int _people = 0;
  String _infoText = "Pode Entrar !";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people <= 0) {
        VisibilityB = false;
        _infoText = "";
      } else if (_people <= 10) {
        VisibilityB = true;
        _infoText = "Bem vindo !";
      } else {
        VisibilityB = true;
        _infoText = "Aguarde...";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool visible;
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: TextButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                VisibilityB
                    ? new Padding(
                        padding: EdgeInsets.all(40.0),
                        child: TextButton(
                          child: Text("-1",
                              style: TextStyle(
                                  fontSize: 40.0, color: Colors.white)),
                          onPressed: () {
                            _changePeople(-1);
                          },
                        ),
                      )
                    : new Container(),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
