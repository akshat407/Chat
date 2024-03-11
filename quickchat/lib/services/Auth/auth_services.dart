import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthServices
{
  //instance of auth


  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  //current user

  User?getCurrentUser()
  {
    return _auth.currentUser;
  }

  Future<UserCredential> signInWithEmailPassword(String email, String password) async
  {
    try {
      UserCredential userCredential= await _auth.signInWithEmailAndPassword(email: email, password: password);

      _firestore.collection("Users").doc(userCredential.user!.uid).set({

          'uid':userCredential.user!.uid,
          'email':email,

        });

      return userCredential;
      
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
     
  }

  //signin
   Future<UserCredential> signUpWithEmailPassword(String email, String password) async
  {
    try {
      UserCredential userCredential= await _auth.createUserWithEmailAndPassword(email: email, password: password);

        _firestore.collection("Users").doc(userCredential.user!.uid).set({

          'uid':userCredential.user!.uid,
          'email':email,

        });
      return userCredential;
      
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
     
  }

  //save user



  //signpu

  Future<void>signout() async{

    return await _auth.signOut();

  }
}