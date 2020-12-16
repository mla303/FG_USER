import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meedu_player/meedu_player.dart';
import 'package:video_player/video_player.dart';

// VideoPlayerController _controller;
// Future<void> _initializeVideoPlayerFuture;

class videoDetail extends StatefulWidget {
  String category_name;
  String videoTitle;
  String videoDescp;
  String videoUrl;
  videoDetail(
      this.category_name, this.videoDescp, this.videoTitle, this.videoUrl);
  @override
  _videoDetailState createState() => new _videoDetailState();
}

class _videoDetailState extends State<videoDetail> {
  MeeduPlayerController _controller = MeeduPlayerController(
      backgroundColor: Color(0xff263238), fullScreenAsLandscape: true);

  Future<void> set(String source) async {
    await _controller.setDataSource(
      autoPlay: false, // optional
      aspectRatio: 16 / 9,
      dataSource: DataSource(
        type: DataSourceType.network,
        dataSource: source,
      ),
      //optional
    );
  }

  @override
  void initState() {
    super.initState();
    this.set(widget.videoUrl);
  }

  dispose() {
    super.dispose();
    _controller.dispose();
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
              automaticallyImplyLeading: true),
        ),
        body: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: MeeduPlayer(controller: _controller)),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width / 1.1,
              child: Column(
                // direction: Axis.horizontal,
                // spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.videoTitle,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    widget.videoDescp,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 7,
                  ),
                ],
              ),
            ),
          ],
        ),
        // StreamBuilder(
        //   stream: FirebaseFirestore.instance.collection("categories").doc(widget.category_name).snapshots(),
        //   builder: (context,snapshot) {
        //     if (!snapshot.hasData)
        //       return Center(child: CircularProgressIndicator());
        //
        //     return
        //       ListView.builder(
        //         itemCount: snapshot.data["videos"].length,
        //         itemBuilder: (BuildContext context, int index) {
        //           print(snapshot.data["videos"].length);
        //           return  _buildListItem(
        //
        //
        //               // context , snapshot.data["videos"][index]["video title"],snapshot.data["videos"][index]["video description"]
        //              context, snapshot.data["videos"][index]["video title"],
        //               snapshot.data["videos"][index]["video description"],
        //             widget.category_name,snapshot.data["videos"][index]["video url"]
        //
        //           );
        //         }
        //         ,
        //
        //       );
        //   }
        // )
      ),
    );
  }
}

_buildListItem(BuildContext context, String videoTitle, String videoDescp,
    String category, String videoURL) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  // CachedVideoPlayerController  controller = CachedVideoPlayerController.network(
  //     "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");

  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      Container(
        height: height / 4,
        width: width / 1.1,
        decoration: BoxDecoration(
          color: const Color(0xff000000),
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
          //   image: AssetImage("Images/slider.png"),
          // )
        ),
        child: Stack(
          children: [
            // Center(
            //     child: controller.value != null && controller.value.initialized
            //         ? AspectRatio(
            //       child: CachedVideoPlayer(controller),
            //       aspectRatio: controller.value.aspectRatio,
            //     )
            //         : Center(
            //       child: CircularProgressIndicator(),
            //     )),
            // IQScreen(
            //   title: videoTitle,
            //   description: videoDescp,
            //   videoPlayerController: VideoPlayerController.network(
            //     videoURL,
            //   ),
            //   iqTheme: IQTheme(
            //     loadingProgress: SpinKitCircle(
            //       color: Colors.white38,
            //     ),
            //     playButtonColor: Colors.transparent,
            //     videoPlayedColor: Colors.indigo,
            //
            //   ),
            // ),
            // Center(
            //   child: Container(
            //     height: height/4.1,
            //     width: width/1.1,
            //     child: Image.asset("Images/slider.png",fit: BoxFit.cover,),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 26,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(
                        color: basicColor,
                      )),
                  color: basicColor,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //       curve: Curves.bounceOut,
                    //       type: PageTransitionType.rightToLeftWithFade,
                    //       duration: Duration(milliseconds: 1000),
                    //       alignment: Alignment.topCenter,
                    //       child: home(),
                    //     ));

                    // controller.play();
                  },
                  child: Wrap(
                    spacing: 1,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        size: 12,
                      ),
                      Text(
                        "Play Video",
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "$category | $videoTitle",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        width: width / 1.1,
        child: Column(
          // direction: Axis.horizontal,
          // spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              videoTitle,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              videoDescp,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: Colors.grey),
              maxLines: 7,
            ),
          ],
        ),
      ),
    ],
  );
}

// _buildListItems(BuildContext context,String videoTitle,String videoDescp)
// {
//   double width = MediaQuery.of(context).size.width;
//   double height = MediaQuery.of(context).size.height;
//   Column(
//     // mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: <Widget>[
//
//       Center(
//         child: Wrap(
//           alignment: WrapAlignment.end,
//           crossAxisAlignment: WrapCrossAlignment.end,
//           runAlignment: WrapAlignment.end,
//           // spacing: 15,
//           children: [
//             Container(
//               height: height/4,
//               width: width/1.1,
//               decoration: BoxDecoration(
//                   color: const Color(0xff000000),
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
//                     image: AssetImage("Images/slider.png"),
//                   )
//               ),
//               child: Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width/4,
//                       height: MediaQuery.of(context).size.height/26,
//                       child: RaisedButton(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25.0),
//                             side: BorderSide(
//                               color: basicColor,
//                             )),
//                         color: basicColor,
//                         textColor: Colors.white,
//                         padding: EdgeInsets.all(8.0),
//                         onPressed: () {
//                           // Navigator.push(
//                           //     context,
//                           //     PageTransition(
//                           //       curve: Curves.bounceOut,
//                           //       type: PageTransitionType.rightToLeftWithFade,
//                           //       duration: Duration(milliseconds: 1000),
//                           //       alignment: Alignment.topCenter,
//                           //       child: home(),
//                           //     ));
//
//
//                         },
//                         child: Wrap(
//                           spacing: 1,
//                           crossAxisAlignment: WrapCrossAlignment.start,
//                           alignment: WrapAlignment.center,
//
//                           children: [
//                             Icon(Icons.play_arrow,size: 12,),
//                             Text(
//                               "Play Video",
//                               style: TextStyle(
//                                 fontSize: 10.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text("Nose pivot | spinning your scooter",style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold
//                         ),),
//                       ))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//
//       const SizedBox(
//         height: 10,
//       ),
//
//       Container(
//         width: width/1.1,
//         child: Column(
//           // direction: Axis.horizontal,
//           // spacing: 5,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               videoTitle,
//               textAlign: TextAlign.left,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(fontWeight: FontWeight.bold),
//               maxLines: 2,
//             ),
//             SizedBox(height: 6,),
//             Text(
//               videoDescp,
//               textAlign: TextAlign.left,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(fontSize: 14,color: Colors.grey),
//               maxLines: 7,
//             ),
//           ],
//         ),
//       ),
//
//
//     ],
//   );
// }
