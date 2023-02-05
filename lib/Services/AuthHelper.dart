
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthHelper {


  AuthHelper._();

  static AuthHelper authHelper = AuthHelper._();
getLoginStates(){
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}


  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;



  storeUserData(String uid, String fname, String lname, email) async {
    try {
      _firestore.collection('Users').doc(uid).set({
        "uid": uid,
        "fname": fname,
        "lname": lname,
        "email": email,
      });
    } on Exception catch (e) {
      print('error is $e');
    }
  }

  //
  // //
  // Future register(var email, var password, String fname, String lname) async {
  //   try {
  //
  //
  //
  //     final credential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email!,
  //       password: password!,
  //     );
  //
  //     String id = credential.user!.uid;
  //     storeUserData(id, fname, lname, email);
  //     return credential;
  //
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //
  //       Fluttertoast.showToast(
  //         msg: "The password is weak",
  //         toastLength: Toast.LENGTH_SHORT,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.black,
  //         textColor: Colors.white,
  //         fontSize: 16.0,
  //       );
  //       print('The password provided is too weak.');
  //
  //     } else if (e.code == 'email-already-in-use') {
  //

  //       Fluttertoast.showToast(
  //         msg: "The account already exists for that email.",
  //         toastLength: Toast.LENGTH_SHORT,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.black,
  //         textColor: Colors.white,
  //         fontSize: 16.0,
  //       );
  //
  //       print('The account already exists for that email.');
  //
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }


  //
  // Future Login(String email, String password) async {
  //   try {
  //     UserCredential userCredential =
  //     await auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     String? id = userCredential.user?.uid;
  //     return userCredential;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //       Fluttertoast.showToast(
  //         msg: "No user found for that email.",
  //         toastLength: Toast.LENGTH_SHORT,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.black,
  //         textColor: Colors.white,
  //         fontSize: 16.0,
  //       );
  //
  //
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //       Fluttertoast.showToast(
  //         msg: "Wrong password provided for that user.",
  //         toastLength: Toast.LENGTH_SHORT,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.black,
  //         textColor: Colors.white,
  //         fontSize: 16.0,
  //       );
  //     }
  //   }
  // }

  resetPassword(String email) async {

    print(email);
    print("eeeeeeee");
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print("sendPasswordResetEmail");
    }on FirebaseAuthException catch(e){
      print(e.message);
    }

  }


  Logout() async {
    await _auth.signOut();
  }


}
