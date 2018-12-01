import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Simple Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      output = '0';
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '/' ||
        buttonText == 'X') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == '.') {
      if (_output.contains(".")) {
        print('Already contain a decimals');
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(output);

      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      if (operand == 'X') {
        _output = (num1 * num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text('$output',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('X')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('∞'),
                    buildButton('+')
                  ],
                ),
                Row(
                  children: <Widget>[buildButton('CLEAR'), buildButton('=')],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
