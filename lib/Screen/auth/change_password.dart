import 'package:flutter/material.dart';

import 'Login.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Align(
          alignment: Alignment.center,
          child: Text("Change Password",
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),),
        ),
      ),
      body: ListView(
        padding:const EdgeInsets.only(top: 100),
        children: [
          Center(
            child: Container(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Container(
                            child: const Text("Enter your new password below.",style:  TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 25,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,

                            ),textAlign: TextAlign.center,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Current Password",
                                hintStyle: const TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "New Password",
                                hintStyle: const TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Confirm New Password",
                                hintStyle: const TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(30.0),
                            color: Theme.of(context).primaryColor,
                            child: MaterialButton(
                              height: 55,
                              minWidth: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              onPressed: () {},
                              child: Text("SAVE",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'PlayfairDisplay',
                                      color: Colors.grey[800],
                                      fontSize: 20)),
                            ),
                          ),
                        ),
                      ],
                    ))),
          ),
        ],
      ),
    );
  }
}
