import 'package:flutter/cupertino.dart';

class NumberDisplay extends StatelessWidget {
  // const NumberDisplay({Key? key}) : super(key: key);
  NumberDisplay({this.value: " "});
  
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children:<Widget> [
          Text(value,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
