// Created by Sanjeev Sangral on 19/09/21.
import 'package:flutter/material.dart';

class ViewUtil {
  static void showSnackBar(GlobalKey<ScaffoldState> _scaffoldKey, String message, Color color) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      backgroundColor: color,
      duration: new Duration(seconds: 2),
      content: new Row(
        children: <Widget>[Flexible(child: new Text(message))],
      ),
    ));
  }

  static bool checkStringIsEmpty(String s) {
    if (s != null && s.isNotEmpty) {
      return true;
    }
    return false;
  }

  static bool checkStringIsLessThenThree(String s) {
    if (s != null && s.isNotEmpty && s.length >3) {
      return true;
    }
    return false;
  }

  static bool checkEmailValid(String value) {
    bool isValid = RegExp(
        r"^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$")
        .hasMatch(value);

    return isValid;
  }
}