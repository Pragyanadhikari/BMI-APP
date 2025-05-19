import 'package:bmi_index/themes/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;

  const MyButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: secondaryColor,
        ),
        child: Center(
          child: Icon(
            icon,
            color: buttonColor,
            size: 60,
          ),
        ),
      ),
    );
  }
}
