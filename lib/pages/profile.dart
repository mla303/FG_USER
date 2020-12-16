import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fg_trcknlgy/presentations/welcomeScreen.dart';
import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'editProfile.dart';

String _personName = "Sohail Ahmad";
String _photo_url;

class profile extends StatefulWidget {
  @override
  _profileState createState() => new _profileState();
}

class _profileState extends State<profile> {
  String text1 = "Personal Info";
  SharedPreferences _preferences;
  @override
  void initState() {
    initShareprefereances();
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((user) {
      setState(() {
        _personName = user["first name"] + " " + user["last name"];
        _photo_url = user["photo url"];
      });
    });
    super.initState();
  }

  initShareprefereances() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    // String text1 = "Personal Info";
    // String personName = "Sohail Ahmad";

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
            centerTitle: true,
            backgroundColor: black,
            // titleSpacing: 40,
            title: Image(
              image: AssetImage("Images/fgText.png"),
              width: MediaQuery.of(context).size.width / 1.8,
              // height: MediaQuery.of(context).size.height / 1,
            ),
            iconTheme: IconThemeData(color: Colors.white),
            automaticallyImplyLeading: false),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: width / 1.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: _photo_url == null
                            ? AssetImage("Images/profile.jpg")
                            : NetworkImage(_photo_url),
                        // minRadius: 20,
                        radius: 45,
                        // borderRadius: BorderRadius.circular(20.0),
                        // child: Image.asset(
                        //   "Images/profile.jpg",
                        //   height: 92,
                        //   width: 92,
                        //   fit: BoxFit.cover,
                        // )
                      ),
                      Text(
                        _personName,
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                            color: Colors.grey,
                            fontSize: 18),

                        // overflow: TextOverflow.ellipsis,
                        // maxLines: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  text1,
                  // textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                      color: Colors.black,
                      fontSize: 16),

                  // overflow: TextOverflow.ellipsis,
                  // maxLines: 5,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              height: 1.3,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          _personName,
                          textAlign: TextAlign.left,
                          style: TextStyle(height: 1.3, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              height: 1.3,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          FirebaseAuth.instance.currentUser.email,
                          textAlign: TextAlign.left,
                          style: TextStyle(height: 1.3, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      _preferences.setBool('isLogin', true);
                      Fluttertoast.showToast(msg: "Logging out");
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageTransition(
                            curve: Curves.bounceOut,
                            type: PageTransitionType.rightToLeftWithFade,
                            duration: Duration(milliseconds: 1000),
                            alignment: Alignment.topCenter,
                            child: WelcomeScreen(),
                          ));
                    }).catchError((error) {
                      Fluttertoast.showToast(msg: error.message.toString());
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Logout",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            height: 1.3,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 18,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                            color: basicColor,
                          )),
                      color: basicColor,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              curve: Curves.bounceOut,
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: Duration(milliseconds: 1000),
                              alignment: Alignment.topCenter,
                              child: editProfile(_personName, _photo_url),
                            ));
                      },
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
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
