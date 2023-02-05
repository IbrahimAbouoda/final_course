import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Services/AuthHelper.dart';
import '../Drawer/drawer.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerFname = TextEditingController();
  TextEditingController controllerLname = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    AuthHelper.authHelper.getLoginStates();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controllerLname;
    controllerFname;
    controllerPassword;
    controllerEmail;

    // TODO: implement dispose
    super.dispose();
  }

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
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    Form(
                      key: globalKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Fist Name';
                                }
                              },
                              // controller: controller1,
                              obscureText: false,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  hintText: "Fist Name",
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'PlayfairDisplay',
                                  ),
                                  prefixIcon: const Icon(Icons.person_outline),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0))),
                              controller: controllerFname,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Last Name';
                                }
                              },
                              // controller: controller2,
                              obscureText: false,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  hintText: "Last Name",
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'PlayfairDisplay',
                                  ),
                                  prefixIcon: const Icon(Icons.person_outline),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0))),
                              controller: controllerLname,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              // controller: controller3,
                              validator: (value) {
                                RegExp regex = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                if (!regex.hasMatch(value!)) {
                                  return "Enter Valid Email";
                                }
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  hintText: "Email Adress",
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'PlayfairDisplay',
                                  ),
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0))),
                              controller: controllerEmail,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  if (val == null || val.length > 100) {
                                    return "User password cant to be larger than 30 letter ";
                                  }
                                  if (val.length < 2) {
                                    return "User password cant to be less than 4 letter ";
                                  }
                                  return "is Empty";
                                }
                              },
                              // controller: controller4,
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
                              controller: controllerPassword,
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
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 15.0, 20.0, 15.0),
                                onPressed: () async {
                                  if (globalKey.currentState!.validate()) {
                                    try {
                                      if (controllerEmail != null &&
                                          controllerPassword != null &&
                                          mounted) {
                                        sendDataProfile();
                                        final newUser = await _auth
                                            .createUserWithEmailAndPassword(
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
                                                      "registering user")));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(newUser
                                                      .credential
                                                      .toString())));
                                        }
                                      } else {
                                        print("null password");
                                      }
                                    } catch (e) {
                                      print(e);
                                    }
                                  } else {
                                    print("null user");
                                  }
                                },
                                child: Text("REGISTER",
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
                      ),
                    ),
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
                      'Already have an account?',
                      style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text(
                          "Login Now",
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

  void sendDataProfile() {
    _firestore.collection('profile').add({
      'name': controllerFname.text,
      'email': controllerEmail.text,
    });
  }
}
