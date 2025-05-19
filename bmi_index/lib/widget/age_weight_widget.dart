import 'package:bmi_index/themes/colors.dart';
import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {
  final Function(double)? onChange;
  final String? title;
  final int initValue;
  final int min;
  final int max;
  const AgeWeightWidget(
      {super.key,
      required this.onChange,
      required this.title,
      required this.initValue,
      required this.min,
      required this.max});

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.initValue;
  }

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
              widget.title!,
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: titleColor),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (counter > widget.min) {
                          counter--;
                        }
                      });
                      widget.onChange!(counter.toDouble());
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (counter < widget.max) {
                          counter++;
                        }
                      });
                      widget.onChange!(counter.toDouble());
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
