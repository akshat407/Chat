import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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

    //construct a chat room 

    //add the message to the database


  }

  //receive messege


}