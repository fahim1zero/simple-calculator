
import 'numberFormatter.dart';

class Calculations{
  static const DOT = '.';
  static const MULTIPLY = 'x';
  static const SUBTRACT = '-';
  static const ADD = '+';
  static const DIVIDE = '÷';
  static const CLEAR  = 'CLEAR';
  static const EQUAL  = '=';
  static const OPERATIONS  = [
    Calculations.ADD,
    Calculations.MULTIPLY,
    Calculations.SUBTRACT,
    Calculations.DIVIDE,
  ];
  
  static double add(double a, double b) => a+b;
  static double subtract(double a, double b) => a-b;
  static double divide(double a, double b) => a/b;
  static double multiply(double a, double b) => a*b;
}

class Calculator{
  static String parseString(String text) {
    List<String> numbersToAdd;
    double a, b, result;
    if (text.contains(Calculations.ADD)) {
      numbersToAdd = text.split(Calculations.ADD);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.add(a, b);
    } else if (text.contains(Calculations.MULTIPLY)) {
      numbersToAdd = text.split(Calculations.MULTIPLY);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.multiply(a, b);
    } else if (text.contains(Calculations.DIVIDE)) {
      numbersToAdd = text.split(Calculations.DIVIDE);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.divide(a, b);
    }
    else if (text.contains(Calculations.SUBTRACT)) {
      numbersToAdd = text.split(Calculations.SUBTRACT);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.subtract(a, b);
    } else {
      return text;
    }

    return NumberFormatter.format(result.toString());
  }
  
  static String addPeriod(String calculatorString){
    if(calculatorString.isEmpty){
      return calculatorString = '0${Calculations.DOT}';
    }
    RegExp exp = RegExp(r"\d\.");
    Iterable<Match> match = exp.allMatches(calculatorString);
    int maxMatches = Calculator.includesOperation(calculatorString) ? 2 : 1;
    
    return match.length == maxMatches
        ? calculatorString : calculatorString += Calculations.DOT;
  }
  
  static bool includesOperation(String calculatorString){
    for (var operation in Calculations.OPERATIONS){
      if (calculatorString.contains(operation)){
        return true;
      }
    }
    return false;
  }
}
