import 'package:dohunstoopit/provider/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorCheckBox extends StatefulWidget {
  final String color;
  const ColorCheckBox({required this.color, super.key});

  @override
  State<ColorCheckBox> createState() => _ColorCheckBoxState();
}

class _ColorCheckBoxState extends State<ColorCheckBox> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return changeColor(widget.color);
    }

    return Center(
      child: Row(
        children: [
          Text(
            widget.color,
            style: TextStyle(
              color: changeColor(widget.color),
              fontSize: 20.0,
            ),
          ),
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: context.watch<ColorTheme>().colors[widget.color],
            onChanged: (bool? value) {
              context.read<ColorTheme>().changeColor(widget.color);
            },
          )
        ],
      ),
    );
  }

  MaterialColor changeColor(String selectedColor) {
    if (selectedColor == "red") {
      return Colors.red;
    } else if (selectedColor == "blue") {
      return Colors.blue;
    } else if (selectedColor == "green") {
      return Colors.green;
    } else {
      return Colors.blueGrey;
    }
  }
}
