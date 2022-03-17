import 'package:calculator/calculatorButton.dart';
import 'package:flutter/cupertino.dart';

class CalculatorRow extends StatelessWidget {
  CalculatorRow({required this.buttons, required this.onTap});
  
  final List<String> buttons;
  final CalculatorButtonTapCallBack onTap;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: rowButtons(),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
  
  List<Widget> rowButtons(){
    List<Widget> allButtons = [];
    
    buttons.forEach((String buttonText) {
      allButtons.add(
        CalculatorButton(
          text: buttonText,
          onTap: onTap,
        )
      );
    });
    return allButtons;
  }
}
