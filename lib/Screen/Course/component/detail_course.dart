import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailCourse extends StatelessWidget {

  const DetailCourse({
    Key? key,
    required this.category,
    required this.by,
    required this.reviews,
    required this.startOn,
    required this.lessions,
    required this.price,
    required this.aboutCourse,
  }) : super(key: key);

  final String category, by, startOn, aboutCourse;
  final int reviews,lessions;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category,
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "By ",
                    style: const TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    by,
                    style: const TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 30,),
                  Text(
                    "$reviews Reviews ",
                    style: const TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "(view All)",
                    style: const TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd0ab1f)),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Start On ",
                    style: const TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    startOn,
                    style: const TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    textAlign: TextAlign.left,
                  ),
                  VerticalDivider(),
                  Text(
                    "$lessions Lessions ",
                    style: const TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0,left: 8.0,top: 20),
              child: Text(
                "$price KWD",
                style: const TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffd0ab1f)
                ),
                textAlign: TextAlign.left,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0,left: 8.0,top: 20),
              child: Text(
                "About this Course ",
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
              child: ReadMoreText(
                aboutCourse,
                style: const TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 16,
                    color: Colors.grey
                ),
                textAlign: TextAlign.left,
                trimLines: 4,
                colorClickableText: Colors.brown,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read More',
                trimExpandedText: 'Show less',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0,left: 8.0,top: 20),
              child: Text(
                "Courses ",
                style: const TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
                maxLines: 2,
              ),
            ),
          ],
        ),
    );
  }
}
class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.lesson,
    required this.number, required this.press,
  }) : super(key: key);

  final String lesson;
  final int number;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
            child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      trailing:
                        Image.asset("assets/images/play.png", fit: BoxFit.cover),
                      title: Row(
                        children: [
                          Text(
                            "Lesson $number :   ",
                            style: const TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                                color: Color(0xffd0ab1f)
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            lesson,
                            style: const TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
              ),
            ),
                  ),
          ),
        ),
      ),
    );
  }
}