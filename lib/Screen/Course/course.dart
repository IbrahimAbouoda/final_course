import 'package:flutter/material.dart';
import 'component/AllCourses.dart';
import 'component/MyCourses.dart';
import 'course_detail.dart';

class Course extends StatefulWidget {
  const Course({Key? key}) : super(key: key);

  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: 2,
      vsync: this,
    );
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(0, 8),
                        blurRadius: 5.0,
                        spreadRadius: 0)
                  ]),
              child: TabBar(
                indicatorColor: Colors.white,
                labelColor: const Color(0xffd0ab1f),
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                padding: const EdgeInsets.all(10),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 20,
                ),
                controller: tabController,
                tabs: const [
                  Text("ALL COURSES"),
                  Text("MY COURSES"),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 680,
              child: TabBarView(
                controller: tabController,
                children: [
                  Container(
                    child: ListView(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 30, left: 20),
                                alignment: Alignment.centerLeft,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  children: [
                                    AllCourses(
                                      image: "assets/images/five.png",
                                      category: "Business Management",
                                      body: "Betty R. Robert",
                                      body2: "14 Lesson",
                                      press: () {
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>CourseDetail()));
                                      },
                                    ),
                                    AllCourses(
                                      image: "assets/images/five.png",
                                      category: "Business Management",
                                      body: "Betty R. Robert",
                                      body2: "14 Lesson",
                                      press: () {},
                                    ),
                                    AllCourses(
                                      image: "assets/images/five.png",
                                      category: "Business Management",
                                      body: "Betty R. Robert",
                                      body2: "14 Lesson",
                                      press: () {},
                                    ),
                                    AllCourses(
                                      image: "assets/images/five.png",
                                      category: "Business Management",
                                      body: "Betty R. Robert",
                                      body2: "14 Lesson",
                                      press: () {},
                                    ),
                                    AllCourses(
                                      image: "assets/images/five.png",
                                      category: "Business Management",
                                      body: "Betty R. Robert",
                                      body2: "14 Lesson",
                                      press: () {},
                                    ),
                                    AllCourses(
                                      image: "assets/images/five.png",
                                      category: "Business Management",
                                      body: "Betty R. Robert",
                                      body2: "14 Lesson",
                                      press: () {},
                                    ),
                                    AllCourses(
                                      image: "assets/images/five.png",
                                      category: "Business Management",
                                      body: "Betty R. Robert",
                                      body2: "14 Lesson",
                                      press: () {},
                                    ),
                                    AllCourses(
                                      image: "assets/images/five.png",
                                      category: "Business Management",
                                      body: "Betty R. Robert",
                                      body2: "14 Lesson",
                                      press: () {},
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
                  Container(
                    child: ListView(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 30, left: 20),
                                alignment: Alignment.centerLeft,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  children: [
                                    MyCourses(
                                      image: "assets/images/four.png",
                                      category: "Biology & The Scientific Method",
                                      body: "30 Jan 2020",
                                      body2: "50 of 14 Lessons",
                                      press: () {},
                                    ),
                                    MyCourses(
                                      image: "assets/images/four.png",
                                      category: "Biology & The Scientific Method",
                                      body: "30 Jan 2020",
                                      body2: "50 of 14 Lessons",
                                      press: () {},
                                    ),
                                    MyCourses(
                                      image: "assets/images/four.png",
                                      category: "Biology & The Scientific Method",
                                      body: "30 Jan 2020",
                                      body2: "50 of 14 Lessons",
                                      press: () {},
                                    ),
                                    MyCourses(
                                      image: "assets/images/four.png",
                                      category: "Biology & The Scientific Method",
                                      body: "30 Jan 2020",
                                      body2: "50 of 14 Lessons",
                                      press: () {},
                                    ),
                                    MyCourses(
                                      image: "assets/images/four.png",
                                      category: "Biology & The Scientific Method",
                                      body: "30 Jan 2020",
                                      body2: "50 of 14 Lessons",
                                      press: () {},
                                    ),
                                    MyCourses(
                                      image: "assets/images/four.png",
                                      category: "Biology & The Scientific Method",
                                      body: "30 Jan 2020",
                                      body2: "50 of 14 Lessons",
                                      press: () {},
                                    ),
                                    MyCourses(
                                      image: "assets/images/four.png",
                                      category: "Biology & The Scientific Method",
                                      body: "30 Jan 2020",
                                      body2: "50 of 14 Lessons",
                                      press: () {},
                                    ),
                                    MyCourses(
                                      image: "assets/images/four.png",
                                      category: "Biology & The Scientific Method",
                                      body: "30 Jan 2020",
                                      body2: "50 of 14 Lessons",
                                      press: () {},
                                    ),
                                    MyCourses(
                                      image: "assets/images/four.png",
                                      category: "Biology & The Scientific Method",
                                      body: "30 Jan 2020",
                                      body2: "50 of 14 Lessons",
                                      press: () {},
                                    ),
                                    MyCourses(
                                      image: "assets/images/four.png",
                                      category: "Biology & The Scientific Method",
                                      body: "30 Jan 2020",
                                      body2: "50 of 14 Lessons",
                                      press: () {},
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
