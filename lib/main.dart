import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _currentOperand = "";
  String _firstOperand = "";
  String _operator = "";
  double _result = 0.0;

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _currentOperand = "";
        _firstOperand = "";
        _operator = "";
        _result = 0.0;
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        _firstOperand = _currentOperand;
        _operator = buttonText;
        _currentOperand = "";
      } else if (buttonText == "=") {
        double num1 = double.parse(_firstOperand);
        double num2 = double.parse(_currentOperand);

        if (_operator == "+") {
          _result = num1 + num2;
        } else if (_operator == "-") {
          _result = num1 - num2;
        } else if (_operator == "*") {
          _result = num1 * num2;
        } else if (_operator == "/") {
          _result = num1 / num2;
        }

        _output = _result.toString();
        _firstOperand = "";
        _operator = "";
        _currentOperand = _result.toString();
      } else {
        if (_currentOperand == "0") {
          _currentOperand = buttonText;
        } else {
          _currentOperand += buttonText;
        }
        _output = _currentOperand;
      }
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blueGrey, padding: EdgeInsets.all(24.0),
            textStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(buttonText),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              _output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("."),
                  buildButton("0"),
                  buildButton("C"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("="),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}



