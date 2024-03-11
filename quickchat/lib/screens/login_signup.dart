import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickchat/services/Auth/auth_services.dart';
import 'package:quickchat/screens/home.dart';
import 'package:quickchat/screens/signup.dart';
import 'package:quickchat/utils/colors.dart';
import 'package:quickchat/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   

 FirebaseAuth auth=FirebaseAuth  .instance;
 FirebaseFirestore _firestore=FirebaseFirestore.instance;

  // final emailcontroller = TextEditingController();
  // final passwordcontroller = TextEditingController();
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();

  //  Future<UserCredential> signInWithEmailAndPassword() async {
  //   try {
  //     final String email = emailcontroller.text.trim();
  //     final String password = passwordcontroller.text.trim();

  //      UserCredential userCredential= await auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     _firestore.collection("Users").doc(userCredential.user!.uid).set({

  //         'uid':userCredential.user!.uid,
  //         'email':email

  //       });

  //       return userCredential;

  //     // Navigate to the next screen after successful login
  //     User? user = auth.currentUser;
  //     if (user != null) {
  //       // Navigate to the HomeScreen using Get.to()
  //       Get.offAll(() => HomePage());
  //   }
  //   else {
  //       utils().toastmessege("User not found");
  //     }
  //   } 
  //   catch (e) {
  //     utils().toastmessege(e.toString());;
  //     // Handle error
  //   }
  // }

  void login(BuildContext context)async{

    final authServices= AuthServices();


    try {
      await authServices.signInWithEmailPassword(emailcontroller.text, passwordcontroller.text);
    } catch (e) {

      showDialog(context: context, builder: (context)=>AlertDialog(

        title: Text(e.toString()),

      ),);
      
    }

  }
  

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _forgotPassword(context),
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter your credential to login"),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: emailcontroller,
          decoration: InputDecoration(
              hintText: "email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none
              ),
              fillColor: chatuser.withOpacity(0.3),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: passwordcontroller,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: chatuser.withOpacity(0.3),
            filled: true,
            prefixIcon: const Icon(Icons.password),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            login(context);
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: chatother.withOpacity(0.7)
          ),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton( 
      onPressed: () {},
      child: const Text("Forgot password?",
        style: TextStyle(color: Colors.black,fontSize: 15),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account? ", style: TextStyle(color: Colors.black,fontSize: 15)),
        TextButton(
            onPressed: () {
              Get.to(SignupPage());
            },
            child: const Text("Sign Up", style: TextStyle(color: Colors.black,fontSize: 15),)
        )
      ],
    );
  }
}