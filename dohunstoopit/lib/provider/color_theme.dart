import 'package:flutter/material.dart';

class ColorTheme with ChangeNotifier {
  MaterialColor color = Colors.blueGrey;

  Map<String, bool> colors = {
    "red": false,
    "green": false,
    "blue": false,
  };

  void changeColor(String selectedColor) {
    colors = {"red": false, "green": false, "blue": false};
    colors[selectedColor] = true;
    if (selectedColor == "red") {
      color = Colors.red;
    } else if (selectedColor == "blue") {
      color = Colors.blue;
    } else if (selectedColor == "green") {
      color = Colors.green;
    }
    notifyListeners();
  }
}
