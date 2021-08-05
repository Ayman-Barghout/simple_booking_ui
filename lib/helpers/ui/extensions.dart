import 'package:flutter/material.dart';

/// Helper Extensions on BuildContext to make it easier calling commonly used properties
extension SugarExt on BuildContext {
  //* Dimensions Extensions
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double heightR(double value) => MediaQuery.of(this).size.height * value;
  double widthR(double value) => MediaQuery.of(this).size.width * value;

  //* Theme Extensions
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);

  //* Close Keyboard
  void closeKeyboard() {
    FocusScope.of(this).requestFocus(FocusNode());
  }
}
