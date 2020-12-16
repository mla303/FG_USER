import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fg_trcknlgy/pages/paymentPage.dart';
import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../adManager.dart';
import 'ImageDetail.dart';

class imagess extends StatefulWidget {
  String category_name;
  List imagesList = [];
  imagess(this.category_name);
  @override
  _imagesState createState() => new _imagesState();
}

class _imagesState extends State<imagess> {
  bool imgdetail = true;
  InterstitialAd _interstitialAd;
  List videosList = [];
  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: AdManager.interstitialAdUnitId,
    );
  }

  @override
  void initState() {
    _interstitialAd = createInterstitialAd();
    _interstitialAd.load();
    FirebaseFirestore.instance
        .collection("categories")
        .doc(widget.category_name)
        .get()
        .then((category) {
      for (var image in category["images"]) {
        setState(() {
          widget.imagesList.add(ImageCatg(
              SongName: image["image title"],
              description: image["image description"],
              imgUrl: image["image url"]));
        });
      }
    });
    super.initState();
  }

  dispose() {
    super.dispose();
    _interstitialAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
              automaticallyImplyLeading: false),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                    // mainAxisSize: MainAxisSize.min,
                    itemCount: widget.imagesList.length,
                    shrinkWrap: false,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _interstitialAd.show();
                          Navigator.push(
                              context,
                              PageTransition(
                                curve: Curves.bounceOut,
                                type: PageTransitionType.rightToLeftWithFade,
                                duration: Duration(milliseconds: 800),
                                alignment: Alignment.topCenter,
                                child: imageDetail(
                                    widget.category_name,
                                    widget.imagesList[index].imgUrl,
                                    widget.imagesList[index].SongName,
                                    widget.imagesList[index].description),
                              ));
                        },
                        child: Center(
                          child: Container(
                            //height: height / 4,
                            width: width / 1.1,
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              semanticContainer: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Wrap(
                                alignment: WrapAlignment.end,
                                crossAxisAlignment: WrapCrossAlignment.end,
                                runAlignment: WrapAlignment.end,
                                spacing: 15,
                                children: [
                                  Container(
                                    height: height / 4,
                                    width: width / 1.1,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff000000),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          colorFilter: new ColorFilter.mode(
                                              Colors.black.withOpacity(0.4),
                                              BlendMode.dstATop),
                                          image: NetworkImage(
                                              widget.imagesList[index].imgUrl),
                                        )),
                                    child: Stack(
                                      children: [
                                        Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "${widget.category_name} | ${widget.imagesList[index].SongName}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCatg {
  String SongName;
  String imgUrl;
  String description;
  ImageCatg({
    this.SongName,
    this.description,
    this.imgUrl,
  });
}
