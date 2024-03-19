import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String displayText = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[900],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    displayText,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Table(
              children: [
                TableRow(
                  children: [
                    buildButton('CA'),
                    buildOperatorButton('/'),
                    buildOperatorButton('*'),
                    buildEqualButton(),
                  ],
                ),
                TableRow(
                  children: [
                    buildNumberButton('7'),
                    buildNumberButton('8'),
                    buildNumberButton('9'),
                    buildOperatorButton('-'),
                  ],
                ),
                TableRow(
                  children: [
                    buildNumberButton('4'),
                    buildNumberButton('5'),
                    buildNumberButton('6'),
                    buildOperatorButton('+'),
                  ],
                ),
                TableRow(
                  children: [
                    buildNumberButton('1'),
                    buildNumberButton('2'),
                    buildNumberButton('3'),
                    buildNumberButton('.'),
                  ],
                ),
                TableRow(
                  children: [
                    buildOperatorButton('('),
                    buildNumberButton('0'),
                    buildOperatorButton(')'),
                    Container(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextButton(
        onPressed: () {
          if (label == 'CA') {
            setState(() {
              displayText = '';
            });
          } else {
            setState(() {
              displayText += label;
            });
          }
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xff202020)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(20.0)),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildNumberButton(String number) {
    return buildButton(number);
  }

  Widget buildOperatorButton(String operator) {
    return buildButton(operator);
  }

  Widget buildEqualButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            try {
              Parser p = Parser();
              Expression exp = p.parse(displayText);
              ContextModel cm = ContextModel();
              displayText =
                  exp.evaluate(EvaluationType.REAL, cm).toStringAsFixed(2);
            } catch (e) {
              displayText = 'Error';
            }
          });
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xff202020)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(20.0)),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
        ),
        child: const Text(
          '=',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
