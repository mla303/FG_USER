import 'package:carousel_slider/carousel_slider.dart';
import 'package:fg_trcknlgy/pages/signIn.dart';
import 'package:fg_trcknlgy/pages/signup.dart';
import 'package:fg_trcknlgy/widgets/socialMedia.dart';
import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';



class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();
}


const List<String> images = [
  "Images/fetto.jpg",
  "Images/fetto.jpg",
  "Images/fetto.jpg",

];

class _WelcomeScreenState extends State<WelcomeScreen> {





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[


        CarouselSlider(
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
        aspectRatio: 16 / 9,
          scrollPhysics: NeverScrollableScrollPhysics(),
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 6),
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        //onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: [
        Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('Images/fetto.jpg'),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.white.withOpacity(0.3), BlendMode.dstATop),
              ),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width
        ),
      ],
        ),


      Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[


                Expanded(
                  flex: 3,
                  child: Container(
                    child: Wrap(
                     direction: Axis.vertical,
                      // spacing: 1,
                      alignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[

                        Text("Welcome",style: TextStyle(
                            color: basicColor,
                            fontSize: 24,
                        fontWeight: FontWeight.w800),),

                        SizedBox(height: 12,),
                        Text("To Your Personalized Profile",style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                        fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,),

                       Image(
                          image: AssetImage("Images/logoo.png"),
                         height: MediaQuery.of(context).size.height/6,
                        ),

                        Image(
                          image: AssetImage("Images/fgText.png"),
                          width: MediaQuery.of(context).size.width/2,
                        ),

                        const SizedBox(height: 20,),

                        Container(
                          width: MediaQuery.of(context).size.width/1.4,
                          height: MediaQuery.of(context).size.height/16,
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
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    type: PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 1000),
                                    alignment: Alignment.topCenter,
                                    child: SignIn(),
                                  ));


                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width/1.4,
                          height: MediaQuery.of(context).size.height/16,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                side: BorderSide(
                                  color: black,
                                )),
                            color: black,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    type: PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 1000),
                                    alignment: Alignment.topCenter,
                                    child: SignUp(),
                                  ));


                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[




                      Text("Follow Us",style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,),

                      SizedBox(height: 10,),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 8,
                        children: [
                          // GestureDetector(
                          //   onTap: () async{
                          //     //Todo implement facebook follow
                          //     // const url = 'https://www.facebook.com';
                          //     if (await canLaunch(fburl)) {
                          //    bool launch_succeeded = await launch(fburl,
                          //     forceSafariVC: false,
                          //       forceWebView: false,
                          //       universalLinksOnly: true
                          //     );
                          //    if(!launch_succeeded)
                          //      {
                          //        launch(fburl,
                          //        forceWebView: false,
                          //          forceSafariVC: true
                          //        );
                          //      }
                          //     } else {
                          //       print("URL launch failed exaption ...//TODO handle its implementation");
                          //     throw 'Could not launch $fburl';
                          //     }
                          //   },
                          //   child: Image(
                          //     image: AssetImage("Images/facebook.png"),
                          //     height: 30,
                          //   ),
                          // ),


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


                        ],
                      )



                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}

