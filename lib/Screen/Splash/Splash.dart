import 'dart:async';
import 'package:flutter/material.dart';
import '../../Services/ProductHelper.dart';
import 'rederctor.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future awaitProduct() async {
    await ProductHelper.productHelper.getProduct2();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    awaitProduct();
    try {
      Timer(
          const Duration(seconds: 1),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Rederctor())));
    } catch (e) {
      print('eroooooooooor$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}
