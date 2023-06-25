import 'package:flutter/material.dart';
import "package:math_expressions/math_expressions.dart";
import 'button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = "";
  var answer = "0.0";

  final List<String> buttons = [
    "C",
    "+/-",
    "%",
    "DEL",
    "7",
    "8",
    "9",
    "/",
    "4",
    "5",
    "6",
    "x",
    "1",
    "2",
    "3",
    "-",
    "0",
    ".",
    "=",
    "+",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.black,
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: MediaQuery.of(context).size.height * 0.75 * 0.02,
                children: buttons.map((e) {
                  var buttonColor = Colors.grey[800];
                  if (["C", "+/-", "%"].contains(e)) {
                    buttonColor = Colors.grey;
                  } else if (["DEL", "/", "x", "-", "+"].contains(e)) {
                    buttonColor = Colors.amber[700];
                  } else if (["="].contains(e)) {
                    buttonColor = Colors.amber[670];
                  }
                  var handlePressed = () => buttonPressed(e);
                  if ("C" == e) {
                    handlePressed = cleanPressed;
                  } else if ("DEL" == e) {
                    handlePressed = deletePressed;
                  } else if ("+/-" == e) {
                    handlePressed = changeSignPressed;
                  } else if ("=" == e) {
                    handlePressed = equalPressed;
                  }
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.23,
                      height: MediaQuery.of(context).size.height * 0.75 * 0.16,
                      child: Button(
                          color: buttonColor,
                          buttonText: e,
                          buttonTapped: handlePressed));
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void buttonPressed(number) {
    setState(() {
      userInput += number;
    });
  }

  void cleanPressed() {
    setState(() {
      userInput = "";
      answer = "0.0";
    });
  }

  void deletePressed() {
    setState(() {
      userInput = userInput.substring(0, userInput.length - 1);
    });
  }

  void changeSignPressed() {
    setState(() {
      userInput = "-($userInput)";
    });
  }

  void equalPressed() {
    String finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      answer = eval.toString();
    });
  }
}
