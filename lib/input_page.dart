// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice/results_page.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'results_page.dart';

const bottonButtonHeight = 80.0;
const activeCardBGColor = Color(0xFF1D1E33);
const inactiveCardBGColor = Color(0xFF111328);
const numberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardBGColor;
  Color femaleCardColor = inactiveCardBGColor;
  int height = 180;
  int weight = 60;
  int age = 15;

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
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          maleCardColor = activeCardBGColor;
                          femaleCardColor = inactiveCardBGColor;
                        });
                      },
                      child: ReusableCard(
                        colour: maleCardColor,
                        cardChild: IconWidget('MALE', FontAwesomeIcons.mars),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          femaleCardColor = activeCardBGColor;
                          maleCardColor = inactiveCardBGColor;
                        });
                      },
                      child: ReusableCard(
                        colour: femaleCardColor,
                        cardChild: IconWidget('FEMALE', FontAwesomeIcons.venus),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: activeCardBGColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          'cms',
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 0.5,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: Colors.white,
                          thumbColor: Colors.pink,
                          inactiveColor: Colors.grey[700],
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardBGColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: FloatingActionButton(
                                  heroTag: "btn1",
                                  elevation: 1.2,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.grey[400],
                                  ),
                                  backgroundColor: Color(0xFF111328),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FloatingActionButton(
                                  heroTag: "btn2",
                                  elevation: 1.2,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.grey[400],
                                  ),
                                  backgroundColor: Color(0xFF111328),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardBGColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: FloatingActionButton(
                                  heroTag: "btn3",
                                  elevation: 1.2,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.grey[400],
                                  ),
                                  backgroundColor: Color(0xFF111328),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FloatingActionButton(
                                  heroTag: "btn4",
                                  elevation: 1.2,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.grey[400],
                                  ),
                                  backgroundColor: Color(0xFF111328),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                double bmi = weight / ((height / 100) * (height / 100));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ResultPage(bmi.toStringAsFixed(1))));
              },
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 25.0,
                    ),
                  ),
                  color: Colors.pink,
                  margin: EdgeInsets.only(
                    top: 10.0,
                  ),
                  width: double.infinity,
                  height: bottonButtonHeight),
            )
          ],
        ));
  }
}
