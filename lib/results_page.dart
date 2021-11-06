import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.bmi);
  String bmi;

  Text tag(String bmi) {
    if (double.parse(bmi) < 18) {
      return const Text(
        'Underweight',
        style: TextStyle(fontSize: 28.0, color: Colors.yellow),
      );
    } else if (double.parse(bmi) < 25) {
      return const Text(
        'Healthy',
        style: TextStyle(fontSize: 28.0, color: Colors.green),
      );
    } else if (double.parse(bmi) < 30) {
      return const Text(
        'Overweight',
        style: TextStyle(fontSize: 28.0, color: Colors.yellow),
      );
    } else {
      return const Text(
        'Obese',
        style: TextStyle(fontSize: 28.0, color: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(13.0),
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: const Color(0xFF1D1E33),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tag(bmi),
                    Center(
                      child: Text(
                        '$bmi',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 55.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 25.0,
                  ),
                ),
                color: Colors.pink,
                margin: const EdgeInsets.only(
                  top: 10.0,
                ),
                width: double.infinity,
                height: 80.0),
          )
        ],
      ),
    );
  }
}
