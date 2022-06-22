import 'package:flutter/material.dart';

void main () {runApp(myApp());}
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPressed ( String buttonText){

    if(buttonText =="CLEAR"){
      _output = "0";
      num1 =0.0;
      num2 = 0.0;
      operand = '';
    }
    else if(buttonText=="+" || buttonText == '-' || buttonText=="/" ||buttonText=="x" ){
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    }
    else if(buttonText=="."){
      if(_output.contains(".")){
        debugPrint("Decimal present");
        return;
      }
      else{
        _output = _output + buttonText;
      }
    }
    else if (buttonText == "="){
      num2 = double.parse(output);
      if (operand == "+"){
        _output = (num1 + num2).toString();
      }
      if (operand == "-"){
        _output = (num1 - num2).toString();
      }
      if (operand == "/"){
        _output = (num1 / num2).toString();
      }
      if (operand == "x"){
        _output = (num1 * num2).toString();
      }

      num1 = 0.0;
      num2 =0.0;
      operand = "";
    }
    else {
      _output = _output + buttonText;
    }

    debugPrint(_output);
    setState(() {
      output = double.parse(_output).toString();
      //toStringAsFixed(2);
    });

  }

  Widget buildButton(String buttonText){
    return Expanded(
        child: OutlineButton(
          padding: const EdgeInsets.all(30.0),
          child: Text(buttonText,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),),

        onPressed: (){ buttonPressed(buttonText);},
        ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 12.0
                  ),
                  child: Text(output, style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,

                  ))),
            ),
            Expanded(
              child: Divider(),
            ),


            Column(
                children: [
              Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/")
              ]),

              Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("x")
              ]),

              Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ]),

              Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("  "),
                buildButton("+")
              ]),

              Row(children: [
                buildButton("CLEAR"),
                buildButton("="),
              ])
            ])
          ],
        ));
  }
}
