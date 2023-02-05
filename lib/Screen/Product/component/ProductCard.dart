import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.category,
    required this.body,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String category, image,body;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.only(left: 20,bottom: 15,right:20),
      child: GestureDetector(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: const Offset(0,10),
                  blurRadius: 5.0,
                  spreadRadius: 0
              )]
          ),
          width: 350,
          height: 75,
          child:ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              // mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading:
                  Container(
                    width: 70,
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.asset(image, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  title: Text(
                    category ,style: const TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                  subtitle: Text(
                    body ,style:const TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffd0ab1f)
                  ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}