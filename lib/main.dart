import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator',
      home: CalculatorDesign(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorDesign extends StatefulWidget {
  const CalculatorDesign({super.key});

  @override
  State<CalculatorDesign> createState() => _CalculatorDesignState();
}

class _CalculatorDesignState extends State<CalculatorDesign> {
  String result = "";
  String operator = "";
  int firstValue = 0;
  int secondValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black26,
        child: Column(children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(14.5),
              child: Text(result,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 55.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              outlineTemplate(value: "9"),
              outlineTemplate(value: "8"),
              outlineTemplate(value: "7"),
              outlineTemplate(value: "/", buttonTextColor: Colors.deepOrange),
            ],
          ),
          Row(
            children: [
              outlineTemplate(value: "6"),
              outlineTemplate(value: "5"),
              outlineTemplate(value: "4"),
              outlineTemplate(value: "X", buttonTextColor: Colors.deepOrange),
            ],
          ),
          Row(
            children: [
              outlineTemplate(value: "3"),
              outlineTemplate(value: "2"),
              outlineTemplate(value: "1"),
              outlineTemplate(
                  value: "-", buttonTextColor: Colors.deepOrange, fontSize: 50),
            ],
          ),
          Row(
            children: [
              outlineTemplate(
                  value: "C",
                  buttonTextColor: const Color.fromARGB(255, 255, 6, 131)),
              outlineTemplate(value: "0"),
              outlineTemplate(
                  value: "=", fontSize: 35, buttonTextColor: Colors.deepOrange),
              outlineTemplate(value: "+", buttonTextColor: Colors.deepOrange),
            ],
          ),
        ]),
      ),
    );
  }

  Widget outlineTemplate(
      {String value = "",
      Color buttonTextColor = Colors.white70,
      double fontSize = 25}) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          if (value == "C") {
            result = "";
          } else if (value == "+" ||
              value == "-" ||
              value == "/" ||
              value == "X") {
            operator = value;
            firstValue = int.parse(result);
            result = "";
          } else if (value == "=") {
            secondValue = int.parse(result);
            if (operator == "+") {
              result = (firstValue + secondValue).toString();
            } else if (operator == "-") {
              result = (firstValue - secondValue).toString();
            } else if (operator == "/") {
              result = (firstValue / secondValue).toString();
            } else if (operator == "X") {
              result = (firstValue * secondValue).toString();
            }
          } else {
            result = result + value;
          }
          setState(() {
            result = result;
          });
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            backgroundColor: MaterialStateProperty.all(Colors.black87),
            shape: MaterialStateProperty.all(const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero))),
            fixedSize:
                MaterialStateProperty.all(const Size(double.infinity, 95)),
            splashFactory: InkRipple.splashFactory,
            side: MaterialStateProperty.all(
                const BorderSide(color: Color.fromARGB(255, 54, 53, 53)))),
        child: Text(
          value,
          style: TextStyle(
            color: buttonTextColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
