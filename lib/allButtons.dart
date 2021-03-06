import 'package:calculator/calculatorButton.dart';
import 'package:calculator/calculatorRow.dart';
import 'package:flutter/cupertino.dart';
import 'calculator.dart';

class AllCalculatorButtons extends StatelessWidget {
  AllCalculatorButtons({required this.onTap});
  
  final CalculatorButtonTapCallBack onTap;
  final calculatorButtonRows = [
    ['7', '8', '9', Calculations.DIVIDE],
    ['4', '5', '6', Calculations.MULTIPLY],
    ['1', '2', '3', Calculations.SUBTRACT],
    [Calculations.DOT, '0', '00', Calculations.ADD],
    [Calculations.CLEAR, Calculations.EQUAL],
  ];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: calculatorButtonRows.map((calculatorRowButtons){
        return CalculatorRow(
          onTap: onTap, 
          buttons: calculatorRowButtons,
        );
      }).toList()
    );
  }
}
