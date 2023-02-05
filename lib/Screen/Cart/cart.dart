import 'package:final_course/Screen/Cart/product_cart.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      padding: const EdgeInsets.only(top: 100),
      children: [
        Center(
          child: Container(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("assets/images/emptycart.png"),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Whoops!",
                      style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Your cart is empty now. Check our products and buy it ",
                      style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontSize: 18,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: Theme.of(context).primaryColor,
                      child: MaterialButton(
                        height: 55,
                        minWidth: MediaQuery.of(context).size.width,
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductCart()));
                        },
                        child: Text("GO TO PRODUCTS",
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
    ));
  }
}
