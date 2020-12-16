import 'package:dots_indicator/dots_indicator.dart';
import 'package:fg_trcknlgy/presentations/welcomeScreen.dart';
import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:fg_trcknlgy/widgets/walkthrough.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 2) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  BannerAd _bannerAd;

  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.bottom);
  }

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.banner,
    );

    // _loadBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: AssetImage("Images/fetto.jpg")
          )
        ),
        // color: Colors.white,
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: PageView(
                children: <Widget>[
                  myWalkthrough(
                    title: "Flat Scooter Riding",
                    content:
                        "To get started, tap the trick category that \nyou want to discover. Videos with trick \ntutorials will be provided for you.",
                    image1: "Images/logoo.png",
                    image2: "Images/fgText.png",
                  ),
                  myWalkthrough(
                    title: "Flat Scooter Riding",
                    content:
                        "There are 5 difficulty levels for flat riding \nBeginner , Intermediate, Advanced, Elite \nand the FLATGOD level.",
                    image1: "Images/logoo.png",
                    image2: "Images/fgText.png",
                  ),
                  myWalkthrough(
                    title: "Flat Scooter Riding",
                    content:
                    "To get started, tap the trick category that \nyou want to discover. Videos with trick \ntutorials will be provided for you.",
                    image1: "Images/logoo.png",
                    image2: "Images/fgText.png",
                  ),
                ],
                controller: controller,
                onPageChanged: _onPageChanged,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: new DotsIndicator(
                position: currentPage.toDouble(),
                dotsCount: 3,
                decorator: DotsDecorator(
                  activeColor: basicColor,
                  color: Colors.grey,
                  activeSize: Size(14, 14),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
//                      numberOfDot: pageLength,
//                      position: currentIndexPage,
//                      dotColor: Colors.black87,
//                      dotActiveColor: Colors.amber
//
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text(lastPage ? "" : "SKIP",
                        style: TextStyle(
                            color: basicColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    onPressed: () => lastPage
                        ? null
                        : Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return WelcomeScreen();
                            }),
                          ),
                  ),
                  FlatButton(
                    child: Text(lastPage ? "GOT IT" : "NEXT",
                        style: TextStyle(
                            color: basicColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    onPressed: () => lastPage
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return WelcomeScreen();
                            }),
                          )
                        : controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
