import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast{
  static void showToast({required String msg, Color color = Colors.lightGreen}){
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: color,
        gravity: ToastGravity.BOTTOM
    );
  }
}