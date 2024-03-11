import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickchat/screens/home.dart';
import 'package:quickchat/screens/login_signup.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){

        //if user is logged in

        if(snapshot.hasData)
        {
          return  HomePage();
        }
        


        //if user is NOT logged in
        else{
          return LoginPage();
        }

      }
      )
      );
    
  }
}