import 'package:flutter/material.dart';

class MyCourses extends StatelessWidget {
  const MyCourses({
    Key? key,
    required this.category,
    required this.body,
    required this.body2,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String category, image, body, body2;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: const Offset(0, 10),
                    blurRadius: 5.0,
                    spreadRadius: 0)
              ]),
          width: 340,
          height: 90,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              // mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Container(
                    width: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.asset(image, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              category,
                              style: const TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Start on:     ',
                              style: TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            ),
                            Text(
                              body2,
                              style: const TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              body2,
                              style: const TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
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
