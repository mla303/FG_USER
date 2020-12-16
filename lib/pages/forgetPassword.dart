import 'package:carousel_slider/carousel_slider.dart';
import 'package:fg_trcknlgy/pages/signIn.dart';
import 'package:fg_trcknlgy/presentations/home.dart';
import 'package:fg_trcknlgy/widgets/navigationBar.dart';
import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';




class forgetPass extends StatefulWidget {
  @override
  _forgetPassState createState() => new _forgetPassState();
}


const List<String> images = [
  "Images/fetto.jpg",
  "Images/fetto.jpg",
  "Images/fetto.jpg",

];

class _forgetPassState extends State<forgetPass> {


  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }



  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
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


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Container(
                width:  MediaQuery.of(context).size.width/1.2,
                // height: height/20,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[




                Column(

                  children: <Widget>[




                    Image(
                      image: AssetImage("Images/logoo.png"),
                      height: MediaQuery.of(context).size.height/9,
                    ),

                    Image(
                      image: AssetImage("Images/fgText.png"),
                      width: MediaQuery.of(context).size.width/2,
                    ),


                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(text: "Reset Password"),
                        // TextSpan(text: "FG ",style: TextStyle(color: yellowcolor)),
                        // TextSpan(text: "TRCKNLGY ",style: TextStyle(color: basicColor)),
                      ]
                      ),
                    ),


                    const SizedBox(height: 20,),




                  ],
                ),


                Wrap(
                  direction: Axis.vertical,

                  spacing: 8,

                  // // alignment: WrapAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email", style: TextStyle(color: Colors.white),),
                    Container(
                      width: width/1.2,
                      child: TextField(
                        style: TextStyle(
                          color: basicColor,
                          fontSize: 14
                        ),

                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                        cursorColor: basicColor,
                        decoration: new InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                            border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(color: Colors.white)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                              borderSide: BorderSide(color: Colors.white),
                            ),


                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800],fontSize: 14),
                            hintText: "Enter your email",
                            fillColor: Colors.white),
                      ),
                    ),

                  ],
                ),


                SizedBox(height: 40,),
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
                      //Todo modify navigator
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                            curve: Curves.bounceOut,
                            type: PageTransitionType.rightToLeftWithFade,
                            duration: Duration(milliseconds: 1000),
                            alignment: Alignment.topCenter,
                            child: SignIn(),
                          ));


                    },
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
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

