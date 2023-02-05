import 'package:flutter/material.dart';

import 'Carousel.dart';

class ProductDetails extends StatefulWidget {
String? price,name ,about,img ;
  ProductDetails({this.name,this.price,this.about, this.img});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Product Detail",
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart_rounded),
        ),],
      ),
      body:
      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15,bottom: 10,right: 15,left: 15),
              child: CarouselContainer(images: [
                widget.img!,
                widget.img!,
                widget.img!,
                widget.img!,
              ],
                product: widget.name!,
                prise: widget.price!,
                counter: 1,
                aboutProduct: widget.about!,
              ),
          ),
        ],
      ) ,
    );
  }
}
