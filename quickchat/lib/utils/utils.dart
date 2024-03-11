import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class utils{
  void toastmessege(String messege)
  {
    Fluttertoast.showToast(
        msg: messege,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}