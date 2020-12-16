import 'dart:async';
import 'package:fg_trcknlgy/presentations/intro.dart';
import 'package:fg_trcknlgy/widgets/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // Future checkFirstSeen() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool _seen = (prefs.getBool('seen') ?? false);
  //
  //   if (_seen) {
  //     Navigator.of(context).pushReplacement(
  //         new MaterialPageRoute(builder: (context) => new WelcomeScreen()));
  //   } else {
  //     await prefs.setBool('seen', true);
  //     //   Navigator.of(context).pushReplacement(
  //     //       new MaterialPageRoute(builder: (context) => new IntroScreen()));
  //     // }
  //   }
  // }
  SharedPreferences _preferences;
  AnimationController _controller;
  Animation<double> _animation, logoanim;
  bool isLogin;
  @override
  void initState() {
    super.initState();
    initSharedPrefereances();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return isLogin == null || false
                  ? IntroScreen()
                  : BottomNavigation();
            })));

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    logoanim = CurvedAnimation(
        parent: AnimationController(
          duration: const Duration(microseconds: 1500),
          vsync: this,
          value: 0,
          lowerBound: 1,
          upperBound: 2,
        ),
        curve: Curves.fastOutSlowIn);

    _controller.forward();
  }

  initSharedPrefereances() async {
    _preferences = await SharedPreferences.getInstance();
    isLogin = _preferences.getBool('isLogin');
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: const Color(0xff000000),
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: AssetImage("Images/fetto.jpg"))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FadeTransition(
                        opacity: logoanim,
                        child: Center(
                          child: Image(
                            image: AssetImage("Images/logoo.png"),
                            height: MediaQuery.of(context).size.height / 6,
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _animation,
                        child: Center(
                          child: Image(
                            image: AssetImage("Images/fgText.png"),
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      new SpinKitPouringHourglass(
                        color: Color(0xffF9FF43),
                        size: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
