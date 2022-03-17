import 'package:flutter/material.dart';

typedef void CalculatorButtonTapCallBack({String buttonText});

class CalculatorButton extends StatelessWidget {
  CalculatorButton({required this.text, required this.onTap});
  
  final String text;
  final CalculatorButtonTapCallBack onTap;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(

        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(1, 1, 1, 0.1),
            width: 1,
          ),
        ),
        child: TextButton(
          onPressed: () => onTap(buttonText: text),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(text,
              style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
