import 'dart:math';

import 'package:bmi_index/pages/score_page.dart';
import 'package:bmi_index/themes/colors.dart';
import 'package:bmi_index/themes/fonts.dart';
import 'package:bmi_index/widget/age_weight_widget.dart';
import 'package:bmi_index/widget/gender_widget.dart';
import 'package:bmi_index/widget/height_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _gender = 0;
  double _height = 150.0; // Default height value
  int _age = 30; // Default age value
  double _weight = 70.0; // Default weight value
  bool _isFinished = false;
  double _bmiScore = 0.0; // Default BMI value
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        bottomOpacity: 5,
        automaticallyImplyLeading: false,
        elevation: 10,
        centerTitle: true,
        title: Text('BMI Index', style: titlefont),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Card(
            elevation: 12,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                //Widget for gender selection
                GenderWidget(
                  onChange: (genderVal) {
                    _gender = genderVal;
                  },
                ),
                HeightWidget(
                  onChange: (heightVal) {
                    _height = heightVal;
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AgeWeightWidget(
                        onChange: (ageVal) {
                          _age = ageVal.toInt();
                        },
                        title: "Age",
                        initValue: 30,
                        min: 0,
                        max: 120),
                    AgeWeightWidget(
                        onChange: (weightVal) {
                          _weight = weightVal;
                        },
                        title: "Weight (kg)",
                        initValue: 70,
                        min: 0,
                        max: 200),
                  ],
                ),
                //Calculate Button
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 20),
                  child: SwipeableButtonView(
                    isFinished: _isFinished,
                    buttonText: "CALCULATE",
                    buttonWidget: Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.grey[800]!),
                    activeColor: primaryColor,
                    onWaitingProcess: () {
                      //Calculate BMI here
                      calculateBMI();
                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          _isFinished = true;
                        });
                      });
                    },
                    onFinish: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                            child: ScorePage(
                              bmiScore: _bmiScore,
                              age: _age,
                            ),
                            type: PageTransitionType.fade),
                      );
                      setState(() {
                        _isFinished = false;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
