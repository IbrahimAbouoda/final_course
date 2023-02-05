import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Drawer/drawer.dart';
import '../auth/Login.dart';


class Rederctor extends StatelessWidget {

  FirebaseAuth user =FirebaseAuth.instance;
  FirebaseFirestore firestore=FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(

        future:Future.value(user.currentUser),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot){
          try{  if (snapshot.hasData){
            user = snapshot.data as FirebaseAuth; // this is your user instance
            /// is because there is user already logged
            return DrawerPage();
          }}catch(e){print("----------------$e");}

          /// other way there is no user logged.
          return Login();
        },

    );




    //   FutureBuilder<FirebaseUser>(
    //     future: FirebaseAuth.instance.currentUser(),
    // builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
    // if (snapshot.hasData){
    // FirebaseUser user = snapshot.data; // this is your user instance
    // /// is because there is user already logged
    // return MainScreen();
    // }
    // /// other way there is no user logged.
    // return LoginScreen();
    // };
  }
}
