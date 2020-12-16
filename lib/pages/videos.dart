import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fg_trcknlgy/adManager.dart';
import 'package:fg_trcknlgy/pages/paymentPage.dart';
import 'package:fg_trcknlgy/pages/videoDetail.dart';
import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:fg_trcknlgy/widgets/videosCategory.dart';
import 'package:firebase_admob/firebase_admob.dart';
// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_thumbnail_generator/video_thumbnail_generator.dart';

class videos extends StatefulWidget {
  String category_name;
  // AdManager adManager=AdManager();
  videos(this.category_name);
  @override
  _videosState createState() => new _videosState();
}

class _videosState extends State<videos> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  InterstitialAd _interstitialAd;
  List videosList = [];
  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: AdManager.interstitialAdUnitId,
    );
  }

  Future<List> getFirebaseData() async {
    DocumentSnapshot category = await firestore
        .collection("categories")
        .doc(widget.category_name)
        .get();

    for (var video in category["videos"]) {
      videosList.add(VideoCatg(
          SongName: video["video title"],
          imgUrl: video["video url"],
          description: video["video description"]));
      return videosList;
    }
  }

  Future<bool> isAdLoded() async {
    bool isloded;
    isloded = await _interstitialAd.isLoaded();
    return isloded;
  }

  // String videoTitle = "Nose pivot – Spinning your scooter";
  @override
  initState() {
    _interstitialAd = createInterstitialAd();
    _interstitialAd.load();

    // widget.adManager.myInterstitial.load();
    super.initState();
  }

  dispose() {
    super.dispose();
    _interstitialAd.dispose();
  }

  bool imgdetail = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black12,
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
              automaticallyImplyLeading: true),
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            Expanded(
                flex: 1,
                child:  Text(
                  "Beginner",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
                  maxLines: 2,
                ),),
            Expanded(
              flex: 15,
                child: FutureBuilder<List>(
                future: getFirebaseData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      // mainAxisSize: MainAxisSize.min,
                        itemCount: videosList.length,
                        shrinkWrap: false,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Wrap(
                              alignment: WrapAlignment.end,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              runAlignment: WrapAlignment.end,
                              spacing: 15,
                              children: [
                                Container(
                                  height: height / 4,
                                  width: width / 1.1,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    semanticContainer: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)),
                                    child: Stack(
                                      children: [
                                        ThumbnailImage(
                                          videoUrl: videosList[index].imgUrl,
                                          fit: BoxFit.cover,
                                          width: 400,
                                          height: 400,
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () async {
                                                _interstitialAd.show();
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      curve: Curves.bounceOut,
                                                      type: PageTransitionType
                                                          .rightToLeftWithFade,
                                                      duration: Duration(
                                                          milliseconds: 800),
                                                      alignment: Alignment
                                                          .topCenter,
                                                      child: videoDetail(
                                                          widget
                                                              .category_name,
                                                          videosList[index]
                                                              .description,
                                                          videosList[index]
                                                              .SongName,
                                                          videosList[index]
                                                              .imgUrl),
                                                    ));
                                              },
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 1.0,
                                                    top: 2.0,
                                                    child: Icon( Icons.play_arrow, color: Colors.grey,
                                                      size: 50,),
                                                  ),
                                                  Icon(
                                                    Icons.play_arrow,
                                                    color: Colors.black,
                                                    size: 50,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Text(
                                                " Title: "
                                                    // "${widget.category_name} | "
                                                    "${videosList[index].SongName}",

                                                style: TextStyle(
                                                    background: Paint()
                                                      ..strokeWidth = 20.0
                                                      ..color = Colors.white
                                                      ..style = PaintingStyle.stroke
                                                      ..strokeJoin = StrokeJoin.round,
                                                    color: Colors.black54,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                ),

                                              ),

                                            ))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: Colors.grey,
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),)


          ],
        ),
      ),
    );
  }
}

class VideoCatg {
  String SongName;
  String imgUrl;
  String description;
  VideoCatg({this.SongName, this.imgUrl, this.description});
}
