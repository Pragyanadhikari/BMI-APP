import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  final Function(int)? onChange;
  const GenderWidget({super.key, required this.onChange});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _selectedGender = 0; // 0 = none, 1 = male, 2 = female

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChoiceChip3D(
            width: 100,
            height: 100,
            border: Border.all(color: Colors.grey),
            style: ChoiceChip3DStyle(
              topColor: _selectedGender == 1 ? Colors.blue : Colors.white,
              backColor: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
            onSelected: () {
              setState(() {
                _selectedGender = 1;
              });
              widget.onChange!(_selectedGender);
            },
            onUnSelected: () {},
            selected: _selectedGender == 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.male,
                  size: 40,
                  color: _selectedGender == 1 ? Colors.white : Colors.blue,
                ),
                const SizedBox(height: 5),
                Text(
                  'Male',
                  style: TextStyle(
                    fontSize: 16,
                    color: _selectedGender == 1 ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          ChoiceChip3D(
            width: 100,
            height: 100,
            border: Border.all(color: Colors.grey),
            style: ChoiceChip3DStyle(
              topColor: _selectedGender == 2 ? Colors.pink : Colors.white,
              backColor: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
            onSelected: () {
              setState(() {
                _selectedGender = 2;
              });
              widget.onChange!(_selectedGender);
            },
            onUnSelected: () {
              setState(() {
                _selectedGender = 0;
              });
            },
            selected: _selectedGender == 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.female,
                  size: 40,
                  color: _selectedGender == 2 ? Colors.white : Colors.pink,
                ),
                const SizedBox(height: 5),
                Text(
                  'Female',
                  style: TextStyle(
                    fontSize: 16,
                    color: _selectedGender == 2 ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
