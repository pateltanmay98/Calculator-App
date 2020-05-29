import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: new ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.white,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  
  String ans = "0";
  int no1, no2;
  String display = "0";
  String ope = "";

  void btnclicked(String val) {
    setState(() {
      if (val == "C") {
        no1 = no2 = 0;
        display = "0";
        ans = "0";
        ope = "";
      } else if (val == "⌫") {
        display = display.substring(0, display.length - 1);
        if (display == "") {
          display = "0";
        }
      } else if (val == "+" || val == "-" || val == "*" || val == "/") {
        if (ans != "0") {
          no1 = int.parse(ans);
          display = "0";
          ope = val;
        } else {
          no1 = int.parse(display);
          display = "0";
          ope = val;
        }
      } else if (val == "=") {
        no2 = int.parse(display);
        if (ope == "+") {
          ans = (no1 + no2).toString();
        }
        if (ope == "-") {
          ans = (no1 - no2).toString();
        }
        if (ope == "*") {
          ans = (no1 * no2).toString();
        }
        if (ope == "/") {
          ans = (no1 ~/ no2).toString();
        }
      } else {
        display = int.parse(display + val).toString();
      }
    });
  }

  Widget btn(String val) {
    return Expanded(
        child: new OutlineButton(
      onPressed: () => btnclicked(val),
      padding: EdgeInsets.all(27.0),
      child: new Text(
        "$val",
        style: new TextStyle(
          fontSize: 17.0,
        ),
      ),
    ));
  }

  Widget btnopr(String val) {
    return Expanded(
        child: new MaterialButton(
      padding: EdgeInsets.all(27.0),
      child: new Text(
        "$val",
        style: new TextStyle(fontSize: 17.0),
      ),
      color: Colors.teal,
      onPressed: () => btnclicked(val),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Expanded(
                child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: new Text(
                "$display",
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )), // Used for operation display
            new Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.bottomRight,
                child: new Text(
                  "$ans",
                  style: new TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),// Used for result display
            new Row(
              children: <Widget>[btn("7"), btn("8"), btn("9"), btnopr("+")],
            ),
            new Row(
              children: <Widget>[btn("4"), btn("5"), btn("6"), btnopr("-")],
            ),
            new Row(
              children: <Widget>[btn("1"), btn("2"), btn("3"), btnopr("*")],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: MaterialButton(
                    padding: EdgeInsets.all(26.5),
                    onPressed: () => btnclicked("C"),
                    color: Colors.red,
                    child: new Text(
                      "C",
                      style: new TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
                btn("0"),
                new Expanded(
                  child: MaterialButton(
                    padding: EdgeInsets.all(25.0),
                    onPressed: () => btnclicked("⌫"),
                    color: Colors.red,
                    child: new Text(
                      "⌫",
                      style: new TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
                btnopr("/")
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: MaterialButton(
                    padding: EdgeInsets.all(20.0),
                    onPressed: () => btnclicked("="),
                    color: Colors.blue,
                    child: new Text(
                      "=",
                      style: new TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}