import 'package:flutter/material.dart';
import 'package:quickchat/screens/login_signup.dart';
import 'package:quickchat/services/Auth/auth_gate.dart';
import 'package:quickchat/utils/images.dart';
// import 'package:libraria/login_signup/login/signup_screen.dart';
// import 'package:libraria/login_signup/login/welcome.dart';
// import 'package:libraria/main.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
@override
void initState()
{
  super.initState();
  _navigatehome();
}

_navigatehome()async{
  await Future.delayed(Duration(milliseconds: 5000),(){});
  Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) =>  AuthGate())));
}

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding:EdgeInsets.only(top: 200),
              child: Image.asset(
                logo,
                width: 250,
                ),
            ),
            SizedBox(height: 100,),
            Text("Connecting people, bridging hearts!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
          ],
        ),
          
      )
      );
  
  }
}