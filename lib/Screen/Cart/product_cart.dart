import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider_controller.dart';
import 'component/Cart.dart';
import 'component/CartContent.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({Key? key}) : super(key: key);

  @override
  _ProductCartState createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Cart",
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    alignment: Alignment.centerLeft,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Cart(
                          image: "assets/images/five.png",
                          category: "The Earth Ceramic Coffee Mug",
                          body: Consumer<MyProvider>(
                            builder: (context, value, child) => Text(
                              "${value.counter * 10.5}",
                              style: const TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffd0ab1f)),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            ),
                          ),
                          counter: 2,
                          press: () {
                            setState(() {});
                          },
                        ),
                        CartContent(
                          subTotal: Consumer<MyProvider>(
                            builder: (context, value, child) => Text(
                              "${value.counter *10} KWD",
                              style: const TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          tax15: Consumer<MyProvider>(
                            builder: (context, value, child) => Text(
                              "${value.counter *100/50}KWD",
                              style: const TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          total: Consumer<MyProvider>(
                            builder: (context, value, child) => Text(
                              "${value.total}KWD",
                              style: const TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
