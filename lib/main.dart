import 'package:calculator/allButtons.dart';
import 'package:calculator/calculator.dart';
import 'package:calculator/history.dart';
import 'package:calculator/numberDisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Simple Calculator')
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({required this.title});
  
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNewEquation = true;
  List<double> values = [];
  List<String> operations = [];
  List<String> calculations = [];
  String calculatorString = " ";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: (){
              _navigateAndDisplayHistory(context);
            },
            icon: Icon(Icons.history),
          )
        ],
      ),
      body: Column(
        children: [
          NumberDisplay(value: calculatorString),
          AllCalculatorButtons(onTap: _onPressed),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
  _navigateAndDisplayHistory(BuildContext context) async {
    final result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => History(operations: calculations)) 
    );
    
    if(result != null){
      setState(() {
        isNewEquation =false;
        calculatorString = Calculator.parseString(result);
      });
    }
  }
  
  void _onPressed({String? buttonText}){
    // Standard mathematical operations
    if(Calculations.OPERATIONS.contains(buttonText)) {
      return setState((){
        operations.add(buttonText!);calculatorString += "$buttonText";
      });
    }
    
    // On CLEAR press
    if(buttonText == Calculations.CLEAR){
      return setState((){
        operations.add(Calculations.CLEAR);
        calculatorString = " ";
      });
    }
    
    // On EQUAL press
    if(buttonText == Calculations.EQUAL){
      String newCalculatorString = Calculator.parseString(calculatorString);
      
      return setState((){
        if(newCalculatorString != calculatorString){
          calculations.add(calculatorString);
        }
        
        operations.add(Calculations.EQUAL);
        calculatorString = newCalculatorString;
        isNewEquation = false;
      });
    }
    
    if(buttonText == Calculations.DOT){
      return setState((){
        calculatorString = Calculator.addPeriod(calculatorString);
      });
    }
    
    setState(() {
      if(!isNewEquation 
        && operations.length > 0 
        && operations.last == Calculations.EQUAL
      ) {
        calculatorString = buttonText!;
        isNewEquation = true;
      } else{
        calculatorString += buttonText!;
      }
    });
  }
}
