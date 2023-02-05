import 'package:flutter/material.dart';
import 'component/FirstCard.dart';
import 'component/SecondCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Checkout Our Demos ",
                      style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FirstCard(
                      image: "assets/images/first.png",
                      category: "How to Add Lightning effect in Photos",
                      body: "Photoshop",
                      press: () {},
                    ),
                    FirstCard(
                      image: "assets/images/first.png",
                      category: "How to Add Lightning effect in Photos",
                      body: "Photoshop",
                      press: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Our Free Courses ",
                      style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SecondCard(
                      image: "assets/images/scond.png",
                      category: "Arts and Humanities",
                      press: () {},
                    ),
                    SecondCard(
                      image: "assets/images/scond.png",
                      category: "Computer Science",
                      press: () {},
                    ),
                    SecondCard(
                      image: "assets/images/scond.png",
                      category: "Computer Science",
                      press: () {},
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Our Paid Courses ",
                      style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SecondCard(
                      image: "assets/images/tree.png",
                      category: "Arts and Humanities",
                      press: () {},
                    ),
                    SecondCard(
                      image: "assets/images/scond.png",
                      category: "Computer Science",
                      press: () {},
                    ),
                    SecondCard(
                      image: "assets/images/scond.png",
                      category: "Computer Science",
                      press: () {},
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
