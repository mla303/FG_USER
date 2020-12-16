import 'package:fg_trcknlgy/presentations/intro.dart';
import 'package:fg_trcknlgy/presentations/welcomeScreen.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:firebase_admob/firebase_admob.dart';
import 'presentations/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseAdMob.instance.initialize(appId: "ca-app-pub-5854556365209295~6668558974");

  await Firebase.initializeApp();
  //  MobileAds.initialize();
  FirebaseAdMob.instance
      .initialize(appId: "ca-app-pub-3940256099942544~3347511713");

  runApp(MyApp());
}

var routes = <String, WidgetBuilder>{
  "/welcome": (BuildContext context) => WelcomeScreen(),
  "/intro": (BuildContext context) => IntroScreen(),
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.grey),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
