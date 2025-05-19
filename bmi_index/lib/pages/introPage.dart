import 'package:flutter/material.dart';
import 'package:bmi_index/components/button.dart';
import 'package:bmi_index/themes/colors.dart';
import 'package:bmi_index/themes/sizes.dart';

class Intropage extends StatelessWidget {
  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenSize.height(context);
    double screenWidth = ScreenSize.width(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'BMI Index',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: 80,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 5,
                    color: buttonColor,
                  ),
                  Positioned(
                    left: screenWidth * 0.6 - 30,
                    top: 10,
                    child: MyButton(
                      icon: Icons.arrow_forward,
                      onTap: () {
                        Navigator.pushNamed(context, '/homescreen');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Get Started",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: buttonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
