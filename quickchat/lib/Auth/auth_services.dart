import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthServices
{
  //instance of auth

  final FirebaseAuth _auth=FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async
  {
    try {
      UserCredential userCredential= await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
      
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
     
  }

  //signin
   Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async
  {
    try {
      UserCredential userCredential= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
      
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
     
  }

  //signpu

  Future<void>signout() async{

    return await _auth.signOut();

  }
}