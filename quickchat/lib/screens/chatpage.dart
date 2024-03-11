// import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:quickchat/components/chatbubble.dart';
import 'package:quickchat/services/Auth/auth_services.dart';
import 'package:quickchat/services/chat/chat_services.dart';
import 'package:quickchat/utils/colors.dart';

class chatpage extends StatelessWidget {


  final String receiveremail;
  final String receiverID;
   chatpage({super.key, required this.receiveremail, required this.receiverID});


  final TextEditingController msgcontroller=TextEditingController();

  //caht and auth servoce
  final chatservice _chatservices=chatservice();

  final AuthServices _auth=AuthServices();

  // /send messagew

  void send() async
  {

    if(msgcontroller.text.isNotEmpty)
    {
      await _chatservices.sendmessege(receiverID, msgcontroller.text);

      msgcontroller.clear();
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiveremail),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildUserInput()
        ],
      ),
    );
  }

  Widget _buildMessageList()
  {
    String senderID=_auth.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatservices.getMessages(receiverID, senderID), 
      builder: (context,snapshot){

        //errors
        if(snapshot.hasError)
        {
          return Text("Error");
        }
        if(snapshot.connectionState==ConnectionState.waiting)
        {
          return Text("Loading...");
        }


        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessagItem(doc)).toList(),
        );


        //loading


        //return list view

      });

    
  }

  Widget _buildMessagItem(DocumentSnapshot doc){
    Map<String,dynamic>data=doc.data() as Map<String,dynamic>;


    //current user
     bool isCurrentUser=data['senderID']==_auth.getCurrentUser()!.uid;
    var alignemnt=isCurrentUser?Alignment.centerRight:Alignment.centerLeft;
    





    return Container(
      // color:color,
      alignment: alignemnt,
      child: Column(
        crossAxisAlignment: isCurrentUser?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
         chatbubble(message: data["message"], isCurrentUser: isCurrentUser)
        ],
      ));
    
  }

  //build message input

  Widget _buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30,left: 10),
      child: Row(
        children: [
          Expanded(child: TextField(
                      controller: msgcontroller,
                      decoration: InputDecoration(
                          hintText: "Enter your message",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: chatuser.withOpacity(0.3),
                          filled: true,
                          prefixIcon: const Icon(Icons.person)),
                    ),
          ),
          IconButton(
            onPressed: send, 
            icon: Icon(Icons.send))
        ],
      ),
    );
  }
}