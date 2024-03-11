import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quickchat/models/message.dart';

class chatservice
{
  //get instance of firestore
final FirebaseFirestore _firestore=FirebaseFirestore.instance;
final FirebaseAuth _auth=FirebaseAuth.instance;

  // ..get user info
  Stream<List<Map<String,dynamic>>> getUsersStream(){
    return _firestore.collection("Users").snapshots().map((snapshot){
      return snapshot.docs.map((doc) {
        final user=doc.data();

        return user;
      }).toList();
    });



  }

  //send messege

  Future<void>sendmessege(String receiverID,message )async{
    //het current user info

    final String currentUserID=_auth.currentUser!.uid;
    final String currentUSerEmail=_auth.currentUser!.email!;
    final Timestamp timestamp=Timestamp.now();

    //create a new message

    Message newMessage=Message(
      senderID: currentUserID, 
      senderEmail: currentUSerEmail, 
      receiverID: receiverID, 
      message: message, 
      timestamp: timestamp);

    //construct a chat room 

    List<String>id=[currentUserID,receiverID];

    id.sort();

    String chatRoomID=id.join('_');



    //add the message to the database

    await _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").add(newMessage.toMap());


  }

  //receive messege


  Stream<QuerySnapshot> getMessages(String userID,otheruserID) {

    List<String>ids=[userID,otheruserID];

    ids.sort();

    String chatRoomID=ids.join('_');



    //add the message to the database

    return _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").orderBy("timestamp",descending: false).snapshots();


  } 

  }


