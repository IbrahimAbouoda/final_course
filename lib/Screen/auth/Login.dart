import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Services/AuthHelper.dart';
import '../Drawer/drawer.dart';
import 'forgotpassword.dart';
import 'register.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  FirebaseAuth _auth=FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.only(top: 100),
        children: [
          Center(
            child: Container(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Form(
                        key: globalKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                validator: (value) {
                                  RegExp regex = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                  if (!regex.hasMatch(value!)) {
                                    return "Enter Valid Email";
                                  }
                                },
                               controller: controllerEmail,
                                obscureText: false,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    hintText: "Email Address",
                                    hintStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'PlayfairDisplay',
                                    ),
                                    prefixIcon:
                                        const Icon(Icons.email_outlined),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "is Empty";
                                  }
                                  if (val.length > 100) {
                                    return "User password cant to be larger than 30 letter ";
                                  }
                                  if (val.length < 4) {
                                    return "User password cant to be less than 4 letter ";
                                  }
                                },
                                controller: controllerPassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    hintText: "Password",
                                    hintStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'PlayfairDisplay',
                                    ),
                                    prefixIcon: const Icon(Icons.lock_outlined),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0))),
                              ),
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Fpassword()));
                                  },
                                  child: const Text(
                                    "Forgot Password?",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontFamily: 'PlayfairDisplay',
                                        color: Color(0xffd0ab1f),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(30.0),
                                color: Theme.of(context).primaryColor,
                                child: MaterialButton(
                                  height: 55,
                                  minWidth: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  onPressed: () async {
                                    if (globalKey.currentState!.validate()) {
                                      try {
                                        if (controllerEmail != null &&
                                            controllerPassword != null &&
                                            mounted) {
                                          final newUser = await _auth
                                              .signInWithEmailAndPassword(
                                              email: controllerEmail.text!,
                                              password:
                                              controllerPassword.text!);

                                          if (newUser != null) {
                                            Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DrawerPage()));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Login user")));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                content: Text(newUser
                                                    .credential
                                                    .toString())));
                                          }

                                        }
                                      } catch (e) {
                                        print(e);
                                      }
                                    }
                                  },
                                  child: Text("LOGIN",
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
                        ))
                  ],
                ))),
          ),
          Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Register()));
                        },
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              color: Color(0xffd0ab1f),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
