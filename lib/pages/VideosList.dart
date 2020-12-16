import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fg_trcknlgy/pages/videos.dart';
import 'package:fg_trcknlgy/widgets/imageCategory.dart';
import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:fg_trcknlgy/widgets/videosCategory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';



class VideosList extends StatefulWidget {



  @override
  _VideosListState createState() => _VideosListState();
}

class _VideosListState extends State<VideosList> {




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
    double height = MediaQuery.of(context).size.height;
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

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              Text(
                "Beginner",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
                maxLines: 2,
              ),


          Container(
//                color: Colors.redAccent,
            padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
            height: MediaQuery.of(context).size.height,

            child: ListView.separated(
                itemCount: VideoCatgList.length,
                shrinkWrap: false,
                physics: NeverScrollableScrollPhysics(),
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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.19,
                        width: MediaQuery.of(context).size.width / 2.8,

                        // decoration: ,
                        child: Card(
                          elevation: 3,
                          shadowColor: Colors.grey,
                          color: Colors.grey[200],
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          semanticContainer: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            // side: BorderSide(width: 1,color: Colors.grey[200])
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRect(
                                // borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  VideoCatgList[index].imgUrl,
                                  height:
                                      MediaQuery.of(context).size.height *
                                          0.14,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, top: 5),
                                child: Text(
                                  VideoCatgList[index].SongName,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: height / 58,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
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
      )
    );
  }
}
