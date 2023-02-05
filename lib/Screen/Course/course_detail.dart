import 'package:flutter/material.dart';

import 'component/detail_course.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Course Detail",
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              DetailCourse(
                  category: "Diploma Of Information Thechnology Network",
                  by: "Gilberto S. Osborne",
                  reviews: 36,
                  startOn: "05 Feb 2020",
                  lessions: 27,
                  price: 75.00,
                  aboutCourse:
                      "Relax and do whatever fits with your design process. Don't set a lot of restrictive hard-and-fast rules. Use filler text where it helps your design process, but use real content if you've got it, as long as it doesn't distract and slow down your design process use real content where possible, and where it doesn't create too much distraction."),
              CourseCard(lesson: "Introduction",number: 1,press: (){},)
            ],
          )),
    );
  }
}
