import 'package:bmi_index/themes/colors.dart';
import 'package:bmi_index/themes/fonts.dart';
import 'package:bmi_index/themes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class ScorePage extends StatelessWidget {
  final double bmiScore;
  final int age;
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;
  ScorePage({super.key, required this.bmiScore, required this.age});

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenSize.height(context);
    double screenWidth = ScreenSize.width(context);
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text('BMI Score', style: titlefont),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 12,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your BMI Score",
                style: subtitlefont,
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              PrettyGauge(
                gaugeSize: 300,
                minValue: 0,
                maxValue: 50,
                segments: [
                  GaugeSegment("Severe Thinness", 16, Colors.red[800]!),
                  GaugeSegment("Moderate Thinness", 1, Colors.pink[100]!),
                  GaugeSegment("Mild Thinness", 1.5, Colors.yellow[500]!),
                  GaugeSegment("Normal", 6.5, Colors.green[800]!),
                  GaugeSegment("Overweight", 5, Colors.yellow[500]!),
                  GaugeSegment("Obese Class I", 5, Colors.pink[100]!),
                  GaugeSegment("Obese Class II", 5, Colors.red[800]!),
                  GaugeSegment("Obese Class III", 10, Colors.red[900]!),
                ],
                valueWidget: Text(
                  bmiScore.toStringAsFixed(1),
                  style: subtitlefont,
                ),
                currentValue: bmiScore.toDouble(),
                needleColor: Colors.cyanAccent,
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Text(
                bmiStatus!, // Display the BMI status
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: bmiStatusColor,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                bmiInterpretation!, // Display the BMI status
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: bmiStatusColor,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Re-calculate BMI"),
                  ),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // ignore: deprecated_member_use
                      Share.share(
                          "Your BMI score is ${bmiScore.toStringAsFixed(1)} at age${age}.");
                    },
                    child: Text("Share"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore < 16) {
      bmiStatus = "Severe Thinness";
      bmiInterpretation =
          "You are severely underweight. It's important to consult a healthcare professional for guidance.";
      bmiStatusColor = Colors.red[800];
    } else if (bmiScore < 17) {
      bmiStatus = "Moderate Thinness";
      bmiInterpretation =
          "You are moderately underweight. Consider seeking advice from a healthcare professional.";
      bmiStatusColor = Colors.pink[100];
    } else if (bmiScore < 18.5) {
      bmiStatus = "Mild Thinness";
      bmiInterpretation =
          "You are mildly underweight. It's advisable to consult a healthcare professional.";
      bmiStatusColor = Colors.yellow[500];
    } else if (bmiScore < 25) {
      bmiStatus = "Normal";
      bmiInterpretation = "You have a normal weight. Keep up the good work!";
      bmiStatusColor = Colors.green[800];
    } else if (bmiScore < 30) {
      bmiStatus = "Overweight";
      bmiInterpretation =
          "You are overweight. Consider making lifestyle changes for better health.";
      bmiStatusColor = Colors.yellow[500];
    } else if (bmiScore < 35) {
      bmiStatus = "Obese Class I";
      bmiInterpretation =
          "You are in the obese class I category. It's important to seek guidance from a healthcare professional.";
      bmiStatusColor = Colors.pink[100];
    } else if (bmiScore < 40) {
      bmiStatus = "Obese Class II";
      bmiInterpretation =
          "You are in the obese class II category. It's crucial to consult a healthcare professional.";
      bmiStatusColor = Colors.red[800];
    } else {
      bmiStatus = "Obese Class III";
      bmiInterpretation =
          "You are in the obese class III category. Immediate medical attention is recommended.";
      bmiStatusColor = Colors.red[900];
    }
  }
}
