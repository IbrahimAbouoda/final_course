import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProfile extends StatefulWidget {
  static const id = "/chat";

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User user;
  dynamic messages;

  TextEditingController controller = TextEditingController();

  void getCurrentUser() {
    user = _auth.currentUser!;
    print(user.email);
  }

  // getmessages() async {
  //   messages = await _firestore.collection('messages').get();
  //   setState(() {});
  //   for (var item in messages.docs){
  //     print(item['text']);
  //   }
  // }

  @override
  void initState() {
    getCurrentUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
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

            Expanded(
              child: StreamBuilder(
                  stream: _firestore.collection('profile').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<dynamic> profile = snapshot.data!.docs as List;
                      return Container(
                          child: ListView.builder(
                              itemCount: profile.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(10),
                                  decoration:
                                      BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    children: [
                                      Container(
                                        
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color.fromRGBO(100, 555, index+55,0)),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Name",
                                                    style:
                                                        TextStyle(fontSize: 24),
                                                  ),
                                                  Text(
                                                    '${profile[index]['name']}',
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Email",
                                                    style:
                                                        TextStyle(fontSize: 24),
                                                  ),
                                                  Text(
                                                    '${profile[index]['email']}',
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                );
                                // MessageBuble(
                                //     profile: profile,
                                //     email: user!.email!,
                                //     index: index,
                                //     name: profile[index]['name']);
                              }));
                    }
                    return Text('loading ...');
                    // return  Expanded(
                    //   child: ListView(
                    //     padding: EdgeInsets.symmetric(horizontal: 16),
                    //     children: [
                    //       for (var item in messages.docs) ...{
                    //         Text('${item['text']}',style:
                    //         TextStyle(fontSize: 20),)}
                    //     ],
                    //   ),
                    // );
                  }),
            ),
            //
            // TextButton(
            //   onPressed: () {
            //     print(controller.text);
            //     _firestore.collection('messages').add({
            //       'text': controller.text,
            //       'sender': user.email,
            //       'time': DateTime.now()
            //     });
            //     controller.clear();
            //   },
            //   child: Text(
            //     'Send',
            //     style: kSendButtonTextStyle,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
