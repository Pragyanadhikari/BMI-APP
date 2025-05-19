import 'package:bmi_index/themes/colors.dart';
import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function(double)? onChange;
  const HeightWidget({super.key, required this.onChange});

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  double _height = 150.0; // Default height value
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Text(
              "Height",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _height.toStringAsFixed(0),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "cm",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Slider(
              min: 0,
              max: 240,
              divisions: 240,
              value: _height.toDouble(),
              onChanged: (value) {
                setState(() {
                  _height = value.toDouble();
                });
                widget.onChange!(_height);
              },
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              thumbColor: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
