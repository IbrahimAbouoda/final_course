import 'package:flutter/material.dart';

import '../../Services/AuthHelper.dart';
import 'Login.dart';
import 'change_password.dart';

class Fpassword extends StatefulWidget {
  Fpassword({Key? key}) : super(key: key);

  @override
  State<Fpassword> createState() => _FpasswordState();
}

class _FpasswordState extends State<Fpassword> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? email;

  reset() {
    var formData = globalKey.currentState;
    if (formData!.validate()) {
      formData.save();
      AuthHelper.authHelper.resetPassword(email!).then((value) =>
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChangePassword())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.only(top: 100),
        children: [
          Form(
            key: globalKey,
            child: Center(
              child: Container(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset("assets/images/graphicforgot.png"),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Forget your Password?",
                          style: TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Enter your registered email address below to receive your password reset",
                          style: TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 18,
                              color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                          onSaved: (val) {
                            setState(() => email = val!);
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                              hintText: "Email Address",
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'PlayfairDisplay',
                              ),
                              prefixIcon: const Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                      ),
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
                            onPressed: () {
                              reset();
                            },
                            child: Text("SEND",
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Remember Password?',
                    style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
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
        ],
      ),
    );
  }
}
