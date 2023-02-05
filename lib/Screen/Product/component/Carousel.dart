// import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselContainer extends StatefulWidget {
  const CarouselContainer({
    Key? key,
    this.images,
    required this.counter,
    required this.product,
    required this.prise,
    required this.aboutProduct
  }) : super(key: key);
  final List<String>? images;
  final String product , prise, aboutProduct;
  final int counter;
  @override
  State<CarouselContainer> createState() => _CarouselContainerState();
}

class _CarouselContainerState extends State<CarouselContainer> {
  int activePage = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: widget.images!.length,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(widget.images, pagePosition, active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(widget.images!.length, activePage)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.product,
            style: const TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
            maxLines: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.prise,
            style: const TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xffd0ab1f)),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: const EdgeInsets.only(bottom: 2),
              width: 90,
              height: 30,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(0, 5),
                      blurRadius: 5.0,
                      spreadRadius: 0)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const InkWell(
                      child: Icon(
                    Icons.remove,
                    color: Colors.grey,
                  )),
                  Text(
                    "${widget.counter}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const InkWell(
                      child: Icon(
                    Icons.add,
                    color: Colors.grey,
                  )),
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0,left: 8.0,top: 20),
          child: Text(
            "About prouduct ",
            style: const TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
            maxLines: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            widget.aboutProduct,
            style: const TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 16,
              color: Colors.grey
            ),
            textAlign: TextAlign.left,
            maxLines: 10,
          ),
        ),Padding(
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
              child: Text("ADD TO CART",
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
    );
  }

  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 5 : 10;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: ExactAssetImage(widget.images![pagePosition]),
              fit: BoxFit.cover)),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.only(top: 10, right: 5, left: 5, bottom: 5),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index
                ? Theme.of(context).primaryColor
                : Color(0xffffebee),
            shape: BoxShape.circle),
      );
    });
  }
}
