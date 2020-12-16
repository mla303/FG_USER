import 'package:fg_trcknlgy/pages/aboutUs.dart';
import 'package:fg_trcknlgy/pages/contactUs.dart';
import 'package:fg_trcknlgy/pages/profile.dart';
import 'package:fg_trcknlgy/presentations/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigationBar();
  }
}

class NavigationBar extends State<BottomNavigation> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedTab = 0;
  final _pageOptions = [
    home(),
    aboutUs(),
    contactUs(),
    profile(),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Color(0xff302D2D),

          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedTab,
          selectedItemColor: Color(0xffffffff),
          unselectedItemColor: Color(0xffffffff),
          elevation: 2,
          onTap: (int index) {
            setState(() {
              // _scaffoldKey.currentState.hideCurrentSnackBar();
              _selectedTab = index;
            });
          },

          selectedIconTheme: IconThemeData(color: Colors.grey),
          // mouseCursor: MouseCursor.defer,

          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: _selectedTab == 0 ? height / 30 : height / 35,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                    fontSize: _selectedTab == 0 ? height / 60 : height / 65),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.messenger,
                size: _selectedTab == 1 ? height / 30 : height / 35,
              ),
              title: Text(
                'About Us',
                style: TextStyle(
                    fontSize: _selectedTab == 1 ? height / 60 : height / 65),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.contacts,
                size: _selectedTab == 2 ? height / 30 : height / 35,
              ),
              title: Text(
                'Contact Us',
                style: TextStyle(
                    fontSize: _selectedTab == 2 ? height / 60 : height / 65),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: _selectedTab == 3 ? height / 30 : height / 35,
              ),
              title: Text('Profile',
                  style: TextStyle(
                      fontSize: _selectedTab == 3 ? height / 60 : height / 65)),
            ),
          ],
        ),
      ),
    );
  }
}
