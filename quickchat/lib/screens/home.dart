import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickchat/Auth/auth_services.dart';
import 'package:quickchat/components/my_drawer.dart';
import 'package:quickchat/screens/login_signup.dart';
import 'package:quickchat/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  Future<void> logout() async {
 try {
    await FirebaseAuth.instance.signOut();
  // await GoogleSignIn().signOut();
  // await FacebookAuth.instance.logOut();
  utils().toastmessege("sign Out successfully");
 } catch (e) {
  utils().toastmessege(e.toString());
   
 }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        
        elevation: 5,
        centerTitle: true,
        title: Text("Home"),
        actions: [
          IconButton(onPressed: ()async{
           await logout();
           Get.to(()=>LoginPage());

          }, icon: Icon(Icons.logout_rounded))
        ],
      ),
      drawer: Mydrawer(),
    );
  }
}