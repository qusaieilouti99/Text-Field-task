import 'package:flutter/material.dart';

class TextFieldState extends ChangeNotifier {
  FocusNode focusNode = FocusNode();
  bool valid = true;
  bool require = true;
  bool isfocused = false;
  bool isempty = true;
  String myValue;

  void buttonOnPressed() {
    myValue.contains('@') ? valid = true : valid = false;
    notifyListeners();
  }

  void onChanged(value) {
    onFocusChange();
    isempty = false;
    require = false;
    myValue = value;
    notifyListeners();
  }

  void onFocusChange() {
    focusNode.addListener(() {
      focusNode.hasFocus ? isfocused = true : isfocused = false;
      notifyListeners();
    });
  }

  void onTap() {
    onFocusChange();
    notifyListeners();
  }
}
