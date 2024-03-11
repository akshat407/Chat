import 'package:flutter/material.dart';
import 'package:quickchat/utils/colors.dart';

class UserTile extends StatelessWidget {

  final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: chatuser,
          borderRadius: BorderRadius.circular(12),

        ),
        
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          
          children: [
            //icon


            Icon(Icons.person),


            SizedBox(width: 20,),


            //username


            Text(text)
          ],
        ),
      ),
    );
  }
}