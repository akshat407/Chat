// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickchat/components/user_tile.dart';
import 'package:quickchat/screens/chatpage.dart';
import 'package:quickchat/services/Auth/auth_services.dart';
import 'package:quickchat/components/my_drawer.dart';
import 'package:quickchat/screens/login_signup.dart';
import 'package:quickchat/services/chat/chat_services.dart';
import 'package:quickchat/utils/utils.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final chatservice _chatservices=chatservice();
  final AuthServices _authServices=AuthServices();


//   Future<void> logout() async {
//  try {
//     await FirebaseAuth.instance.signOut();
//   // await GoogleSignIn().signOut();
//   // await FacebookAuth.instance.logOut();
//   utils().toastmessege("sign Out successfully");
//  } catch (e) {
//   utils().toastmessege(e.toString());
   
//  }
// }

void signout(){
  final _auth=AuthServices();
  _auth.signout();
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
          IconButton(onPressed: (){
            signout();
          

          }, icon: Icon(Icons.logout_rounded))
        ],
      ),
      drawer: Mydrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList()
  {
    return StreamBuilder(stream: _chatservices.getUsersStream(), builder: (context,snapshot){

      if(snapshot.hasError)
      {
        return Text("Error");
      }
      if(snapshot.connectionState==ConnectionState.waiting)
      {
        return Text("Loading...");
      }

      return ListView(
        children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData,context)).toList(),
      );


    });
  }

  //build indiviuyal list

  Widget _buildUserListItem(Map<String,dynamic>userData,BuildContext context)
  {
    if(userData['email']!=_authServices.getCurrentUser()!.email){
      return UserTile(
      text: userData['email'],
      onTap: (){
        Get.to(() => chatpage(receiveremail: userData['email'],));
      }
      );
    }
    else
    {
      return Container();
    }
  }


}