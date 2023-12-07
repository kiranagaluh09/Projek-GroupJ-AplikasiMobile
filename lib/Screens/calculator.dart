import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
 Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                child: Center(
                  child: Text(
                    'Calculator',
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              )
              

            ],
          ),
          Expanded(
            child: SimpleCalculator(
              theme: const CalculatorThemeData(
                borderWidth: 0,
                operatorColor: Color(0xFF1E232C),
                displayColor: Colors.transparent,
                displayStyle: TextStyle(
                 fontSize: 48.0,
                 fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
        )
    );
 }
}