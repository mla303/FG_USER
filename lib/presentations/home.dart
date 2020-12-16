import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fg_trcknlgy/pages/VideosList.dart';
import 'package:fg_trcknlgy/pages/videos.dart';
import 'package:fg_trcknlgy/widgets/ImageSlider.dart';
import 'package:fg_trcknlgy/widgets/imageCategory.dart';
import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:fg_trcknlgy/widgets/videosCategory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => new _homeState();
}

List cardList = [
  Item1(),
  Item2(),
  Item3(),
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class _homeState extends State<home> {
  int _currentIndex = 0;

  String catgr1 = "Beginner";
  String catgr2 = "Intermediate";
  String catgr3 = "Advanced";
  String catgr4 = "Elite";
  String catgr5 = "Flatgod";


  String user_name;
  List VideoCatgList = [];
  List imageCatgList = [];

  @override
  void initState() {
    FirebaseFirestore.instance.collection("categories").get().then((documents) {
      setState(() {
        for (var document in documents.docs) {
          if (document["total videos"] > 0) {
            print(document.id);
            VideoCatgList.add(
                VideoCat(SongName: document.id, imgUrl: document["photo url"]));
          }

          if (document["total images"] > 0) {
            imageCatgList.add(
                imageCatg(Name: document.id, imgUrl: document["photo url"]));
          }
        }
      });
    });
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((user) {
      user_name = user.data()['first name'];
      setState(() {});
    });
    super.initState();
  }


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
              automaticallyImplyLeading: false),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(

                options: CarouselOptions(

                  aspectRatio: 2.4,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          semanticContainer: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: Colors.blueAccent,
                          child: card,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: _currentIndex == index ? 12 : 8,
                    height: _currentIndex == index ? 12 : 8,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? basicColor : Colors.grey,
                    ),
                  );
                }),
              ),

              //beginner
              const SizedBox(
                height: 10,
              ),



              Container(
//                color: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
                height: MediaQuery.of(context).size.height,

                child: ListView.separated(
                    itemCount: CatogartData.length,
                    shrinkWrap: false,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                curve: Curves.bounceOut,
                                type: PageTransitionType.rightToLeftWithFade,
                                duration: Duration(milliseconds: 800),
                                alignment: Alignment.topCenter,
                                child: videos(VideoCatgList[index].SongName),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 3.0, top: 5),
                                child: Text(
                                  CatogartData[index].title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: height / 58,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                height: height/5,
                                width: width/1.1,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(image: AssetImage(CatogartData[index].imageUrl,),
                                        fit: BoxFit.cover)
                                ),
                              ),

                            ],
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


              SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
