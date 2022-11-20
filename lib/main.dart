// ignore_for_file: duplicate_ignore

import 'dart:io';

import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: const Color.fromARGB(0, 10, 92, 199)),
    home: const MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 100;
  double _weight = 50;
  int _bmi = 0;
  String _condition = " Select data";
  // ignore_for_file: prefer_const_constructors
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: s.height * 0.35,
            width: double.infinity,
            decoration: BoxDecoration(color: Color.fromARGB(207, 13, 107, 231)),
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "BMI",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                const Text("Calculator",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    child: Text(
                      "$_bmi",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 55),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                RichText(
                    text: TextSpan(
                        text: "Condition:",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <TextSpan>[
                      TextSpan(
                          text: _condition,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))
                    ]))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Text("Choose Values",
                    style: TextStyle(
                        color: Color.fromARGB(207, 13, 107, 231),
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
                SizedBox(
                  height: s.height * 0.05,
                ),
                RichText(
                    text: TextSpan(
                        text: "Height: ",
                        style: TextStyle(
                            color: Color.fromARGB(207, 13, 107, 231),
                            fontSize: 25),
                        children: <TextSpan>[
                      TextSpan(
                          text: "$_height cm",
                          style: TextStyle(
                              color: Color.fromARGB(207, 13, 107, 231),
                              fontSize: 25,
                              fontWeight: FontWeight.bold))
                    ])),
                Slider(
                  value: _height,
                  min: 0,
                  max: 250,
                  onChanged: (height) {
                    setState(() {
                      _height = height;
                    });
                  },
                  label: "$_height",
                  divisions: 500,
                  activeColor: Color.fromARGB(255, 24, 103, 206),
                ),
                SizedBox(
                  height: s.height * 0.05,
                ),
                RichText(
                    text: TextSpan(
                        text: "Weight: ",
                        style: TextStyle(
                            color: Color.fromARGB(207, 13, 107, 231),
                            fontSize: 25),
                        children: <TextSpan>[
                      TextSpan(
                          text: "$_weight Kg",
                          style: TextStyle(
                              color: Color.fromARGB(207, 13, 107, 231),
                              fontSize: 25,
                              fontWeight: FontWeight.bold))
                    ])),
                Slider(
                  value: double.parse(_weight.toStringAsPrecision(2)),
                  min: 0,
                  max: 300,
                  onChanged: (weight) {
                    setState(() {
                      _weight = weight;
                    });
                  },
                  label: "$_weight",
                  divisions: 600,
                  activeColor: Color.fromARGB(255, 24, 103, 206),
                ),
                SizedBox(
                  height: s.height * 0.05,
                ),
                Container(
                  width: s.width * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _bmi = (_weight / ((_height / 100) * (_height / 100)))
                              .round()
                              .toInt();
                          if (_bmi >= 18 && _bmi <= 25) {
                            _condition = "Normal";
                          } else if (_bmi > 25 && _bmi <= 30) {
                            _condition = "Overweight";
                          } else if (_bmi > 30) {
                            _condition = "Obesity";
                          } else {
                            _condition = "Underweight";
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(207, 13, 107, 231)),
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
