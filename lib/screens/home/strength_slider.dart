import 'package:flutter/material.dart';

class StrengthSlider extends StatefulWidget {
  final int initialStrength;
  final Function (int) onChanged;
  const StrengthSlider({
  super.key,
  required this.initialStrength,
    required this.onChanged
});

@override
State<StrengthSlider> createState() => _StrengthSliderState();
}

class _StrengthSliderState extends State<StrengthSlider> {
  late int strength;

  @override
  void initState() {
  super.initState();
  strength = widget.initialStrength;
  }

  @override
Widget build(BuildContext context) {
    return Slider(
    min: 100,
    max: 900,
    divisions: 8,
    value: strength.toDouble(),
    onChanged: (val) {
      setState(() {
        strength = val.round();
        widget.onChanged(strength);
    });
    },
    activeColor: Colors.brown[strength],
    inactiveColor: Colors.brown[strength],
    );
    }
}
