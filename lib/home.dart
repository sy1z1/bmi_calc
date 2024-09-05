import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double heightSliderVal = 50;
  static double weightSliderVal = 50;
  static double bmiResult = 0;
  static bool visibleResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("BMI CALCUALTOR")),
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/bmi.jpg"),
          Text(
              'Height : ${double.parse(heightSliderVal.toDouble().toStringAsFixed(2))} cm',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            Slider(
              value: heightSliderVal,
              min: 0,
              max: 200,
              divisions: 100,
              label: heightSliderVal.toStringAsFixed(0),
              onChanged: (double value) {
                setState(() {
                  heightSliderVal = value;
                });
              },
            ),
          Text(
            'Weight : ${double.parse(weightSliderVal.toDouble().toStringAsFixed(2))} Kg',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Slider(
            value: weightSliderVal,
            min: 0,
            max: 200,
            divisions: 100,
            label: weightSliderVal.toStringAsFixed(0),
            onChanged: (double value) {
              setState(() {
                weightSliderVal = value;
              });
            },
          ),
          ElevatedButton(
              onPressed: () {
              setState(() {
                bmiResult = weightSliderVal / pow((heightSliderVal/100), 2);
                visibleResult = true;
              });
              },
              child: const Text('Calculate'),
          ),
          Visibility(
            visible: visibleResult,
            child: Text(
              'Your BMI Result are : ${double.parse(bmiResult.toDouble().toStringAsFixed(2))} '
            ),
          )
        ],
      ),
    );
  }
}
