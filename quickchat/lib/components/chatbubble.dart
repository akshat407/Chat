import 'package:flutter/material.dart';
import 'package:quickchat/utils/colors.dart';

class chatbubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
   chatbubble({super.key, required this.message, required this.isCurrentUser});


  // var color=isCurrentUser? chatuser:chatother;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border
        borderRadius: BorderRadius.circular(10),
        color: isCurrentUser?chatuser:chatother,
              ),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(10),
              child: Text(message,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'MadimiOne'),),
    );
  }
}