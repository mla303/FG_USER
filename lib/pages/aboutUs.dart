import 'package:carousel_slider/carousel_slider.dart';
import 'package:fg_trcknlgy/pages/signIn.dart';
import 'package:fg_trcknlgy/widgets/ImageSlider.dart';
import 'package:fg_trcknlgy/widgets/imageCategory.dart';
import 'package:fg_trcknlgy/widgets/socialMedia.dart';
import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:fg_trcknlgy/widgets/videosCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class aboutUs extends StatefulWidget {
  @override
  _aboutUsState createState() => new _aboutUsState();
}



class _aboutUsState extends State<aboutUs> {

  String videoTitle = "About Us";
  String aboutUs = "My name is Henrik Palm. Im 23 years old and I live in Sweden. I've been riding scooters for the past 11 years. I specialize in flat riding whereas I hold over 90 world's firsts. I live to inspire my audience and to share the awesomeness of this sport to the outside world. \nI think everybody should have the best scootering knowledge for free. Therefore I created the Flatgod tricknology application that will get you on the right foot whether you're a complete beginner or experienced.";



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
        body: Padding(
          padding: const EdgeInsets.only(left:18.0),
          child: Container(
            width: width/1.1,
            child: Column(
              // direction: Axis.vertical,
              // alignment: WrapAlignment.start,
              // crossAxisAlignment: WrapCrossAlignment.start,
              // verticalDirection: VerticalDirection.down,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                const SizedBox(
                  height: 10,
                ),

                Text(
                  videoTitle,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
                  maxLines: 2,
                ),
                SizedBox(height: 6,),
                Container(
                  width: width/1.1,
                  child: Text(
                    aboutUs,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14,color: Colors.grey),
                    maxLines: 12,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Follow Us",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                  maxLines: 2,
                ),

                SizedBox(height: 6,),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  children: [

                    // GestureDetector(
                    //   onTap: () async{
                    //     //Todo implement facebook follow
                    //     // const url = 'https://www.facebook.com';
                    //     if (await canLaunch(fburl)) {
                    //       bool launch_succeeded = await launch(fburl,
                    //           forceSafariVC: false,
                    //           forceWebView: false,
                    //           universalLinksOnly: true
                    //       );
                    //       if(!launch_succeeded)
                    //       {
                    //         launch(fburl,
                    //             forceWebView: false,
                    //             forceSafariVC: true
                    //         );
                    //       }
                    //     } else {
                    //       print("URL launch failed exaption ...//TODO handle its implementation");
                    //       throw 'Could not launch $fburl';
                    //     }
                    //   },
                    //   child: Image(
                    //     image: AssetImage("Images/facebook.png"),
                    //     height: 30,
                    //   ),
                    // ),

                    GestureDetector(
                      onTap: () async{
                        //Todo implement twitter follow
                        // const url = 'https://www.twitter.com';
                        if (await canLaunch(youtubeurl)) {
                          bool launch_succeeded = await launch(youtubeurl,
                              forceSafariVC: false,
                              forceWebView: false,
                              universalLinksOnly: true
                          );
                          if(!launch_succeeded)
                          {
                            launch(youtubeurl,
                                forceWebView: false,
                                forceSafariVC: true
                            );
                          }
                        } else {
                          print("URL launch failed exaption ...//TODO handle its implementation");
                          throw 'Could not launch $youtubeurl';
                        }
                      },
                      child: Image(
                        image: AssetImage("Images/youtube.png"),
                        height: 30,
                      ),
                    ),


                    GestureDetector(
                      onTap: ()async{
                        //Todo implement instagram follow
                        // const url = 'https://www.instagram.com';
                        if (await canLaunch(instaurl)) {
                          bool launch_succeeded = await launch(instaurl,
                              forceSafariVC: false,
                              forceWebView: false,
                              universalLinksOnly: true
                          );
                          if(!launch_succeeded)
                          {
                            launch(instaurl,
                                forceWebView: false,
                                forceSafariVC: true
                            );
                          }
                        } else {
                          print("URL launch failed exaption ...//TODO handle its implementation");
                          throw 'Could not launch $instaurl';
                        }
                      },
                      child: Image(
                        image: AssetImage("Images/instagram.png"),
                        height: 30,
                      ),
                    ),


                    GestureDetector(
                      onTap: ()async{
                        //Todo implement google + follow
                        // const url = 'https://myaccount.google.com/';
                        if (await canLaunch(tiktokUrl)) {
                          bool launch_succeeded = await launch(tiktokUrl,
                              forceSafariVC: false,
                              forceWebView: false,
                              universalLinksOnly: true
                          );
                          if(!launch_succeeded)
                          {
                            launch(tiktokUrl,
                                forceWebView: false,
                                forceSafariVC: true
                            );
                          }
                        } else {
                          print("URL launch failed exaption ...//TODO handle its implementation");
                          throw 'Could not launch $tiktokUrl';
                        }
                      },
                      child: Image(
                        image: AssetImage("Images/tiktok.png"),
                        height: 30,
                      ),
                    ),

                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
