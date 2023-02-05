import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Services/AuthHelper.dart';
import '../Cart/cart.dart';
import '../Course/course.dart';
import '../Home/home.dart';
import '../Home/profile.dart';
import '../Product/product.dart';
import '../auth/Login.dart';
import '../auth/forgotpassword.dart';
import '../auth/settings.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.home) {
      container = const Home();
    } else if (currentPage == DrawerSections.course) {
      container = const Course();
    } else if (currentPage == DrawerSections.forgetPassword) {
      container = Fpassword();
    } else if (currentPage == DrawerSections.news) {
      container = const Home();
    } else if (currentPage == DrawerSections.products) {
      container = const Product();
    } else if (currentPage == DrawerSections.cart) {
      container = const Cart();
    } else if (currentPage == DrawerSections.myProfile) {
      container = MyProfile();
    } else if (currentPage == DrawerSections.settings) {
      container = const Settings();
    } else if (currentPage == DrawerSections.logout) {
      _auth.signOut();
      AuthHelper.authHelper.Logout().then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          ));
      // container = Login();
    }
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: AppBarContainer(),
        // bottom: currentPage == DrawerSections.course? TabBar(
        //   padding: EdgeInsets.only(top: 10),
        //   indicator: BoxDecoration(
        //       borderRadius: BorderRadius.circular(50), // Creates border
        //       color: Colors.white),
        //   tabs: [
        //     Tab(icon: Icon(Icons.flight)),
        //     Tab(icon: Icon(Icons.directions_transit)),
        //   ],
        // ): PreferredSize(
        //     child: Container(
        //       height: 0,
        //     ),
        //     preferredSize: Size.fromHeight(0)),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      body: container,
    );
  }

  Widget AppBarContainer() {
    if (currentPage == DrawerSections.home) {
      return Container(
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "Home",
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else if (currentPage == DrawerSections.course) {
      return Container(
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "Course",
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else if (currentPage == DrawerSections.news) {
      return Container(
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "News",
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else if (currentPage == DrawerSections.products) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Products",
                  style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(),
            Icon(Icons.shopping_bag)
          ],
        ),
      );
    } else if (currentPage == DrawerSections.cart) {
      return Container(
        child: const Align(
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
      );
    } else if (currentPage == DrawerSections.myProfile) {
      return Container(
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "MyProfile",
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else if (currentPage == DrawerSections.settings) {
      return Container(
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "Settings",
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else if (currentPage == DrawerSections.logout) {
      return Container();
    }
    return Container();
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.home_filled,
              currentPage == DrawerSections.home ? true : false),
          const Divider(),
          menuItem(2, "Course", Icons.book,
              currentPage == DrawerSections.course ? true : false),
          const Divider(),
          menuItem(3, "News", Icons.wysiwyg,
              currentPage == DrawerSections.news ? true : false),
          const Divider(),
          menuItem(4, "Products", Icons.shopping_bag,
              currentPage == DrawerSections.products ? true : false),
          const Divider(),
          menuItem(5, "Cart", Icons.shopping_cart_rounded,
              currentPage == DrawerSections.cart ? true : false),
          const Divider(),
          menuItem(6, "MyProfile", Icons.person_pin,
              currentPage == DrawerSections.myProfile ? true : false),
          const Divider(),
          menuItem(7, "Settings", Icons.settings,
              currentPage == DrawerSections.settings ? true : false),
          const Divider(),
          menuItem(8, "Logout", Icons.logout,
              currentPage == DrawerSections.logout ? true : false),
          const Divider(),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      // color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.course;
            } else if (id == 3) {
              currentPage = DrawerSections.news;
            } else if (id == 4) {
              currentPage = DrawerSections.products;
            } else if (id == 5) {
              currentPage = DrawerSections.cart;
            } else if (id == 6) {
              currentPage = DrawerSections.myProfile;
            } else if (id == 7) {
              currentPage = DrawerSections.settings;
            } else if (id == 8) {
              currentPage = DrawerSections.logout;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 25,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(title,
                    style: const TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 18,
                        color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget MyHeaderDrawer() {
  return Container(
    width: double.infinity,
    height: 250,
    padding: const EdgeInsets.only(top: 20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10, top: 25),
          height: 110,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/user.jpg'),
            ),
          ),
        ),
        const Text(
          "Rachelle D. Michael",
          style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

enum DrawerSections {
  home,
  course,
  news,
  products,
  cart,
  myProfile,
  settings,
  logout,
  profile,
  forgetPassword
}
