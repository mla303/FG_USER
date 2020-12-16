import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fg_trcknlgy/firebasee/auth.dart';
import 'package:fg_trcknlgy/firebasee/firestore.dart';
import 'package:fg_trcknlgy/pages/signIn.dart';
import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

bool saving = false;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}


const List<String> images = [
  "Images/fetto.jpg",
  "Images/fetto.jpg",
  "Images/fetto.jpg",

];

class _SignUpState extends State<SignUp> {

  Authentication authentication = Authentication();
  DB db =DB();
  TextEditingController first_name_controller = TextEditingController();
  TextEditingController last_name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

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
        body: ModalProgressHUD(
          inAsyncCall: saving,
          child: Stack(
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

              SingleChildScrollView(
                child: Column(

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
                            TextSpan(text: "Join the "),
                            TextSpan(text: "FG ",style: TextStyle(color: yellowcolor)),
                            TextSpan(text: "TRCKNLGY ",style: TextStyle(color: basicColor)),
                            TextSpan(text: "Community "),
                          ]
                          ),
                        ),


                        const SizedBox(height: 20,),




                      ],
                    ),


                    Wrap(
                      direction: Axis.vertical,

                      spacing: 2,

                      // // alignment: WrapAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Text("First Name", style: TextStyle(color: Colors.white),),
                        Container(
                          width: width/1.2,
                          child: TextField(
                            controller: first_name_controller,
                            style: TextStyle(
                                color: basicColor,
                                fontSize: 14
                            ),

                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
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
                                hintText: "Enter first name",
                                fillColor: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text("Last Name", style: TextStyle(color: Colors.white),),
                        Container(
                          width: width/1.2,
                          child: TextField(
                            controller:last_name_controller,
                            style: TextStyle(
                                color: basicColor,
                                fontSize: 14
                            ),

                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
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
                                hintText: "Enter last name",
                                fillColor: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 10,),
                        Text("Email", style: TextStyle(color: Colors.white),),
                        Container(
                          width: width/1.2,
                          child: TextField(
                            controller:email_controller,
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

                        const SizedBox(height: 10,),
                        Text("Password", style: TextStyle(color: Colors.white),),
                        Container(
                          width: width/1.2,
                          child: TextField(
                            controller: password_controller,
                            style: TextStyle(
                                color: basicColor,
                                fontSize: 14
                            ),

                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            onSubmitted: (_) => FocusScope.of(context).unfocus(),

                            cursorColor: basicColor,
                            obscureText: _obscureText,
                            decoration: new InputDecoration(
                                contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),

                                suffixIcon: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  iconSize: 18,
                                  color: basicColor,
                                  onPressed: _toggle,
                                ),

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
                                hintStyle: new TextStyle(color: Colors.grey[800], fontSize: 14),
                                hintText: "Enter Password",
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
                          //Todo
                          if(first_name_controller.text.trim()==""||last_name_controller.text.trim()==""||
                          email_controller.text.trim()==""||password_controller.text.trim()==""
                          ){
                            Fluttertoast.showToast(
                                msg: "Please enter all fields",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.red[400],
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                          else
                            {
                              setState(() {
                                saving= true;
                              });
                              authentication.createUser(email_controller.text.trim(), password_controller.text.trim()).then((value) {
                                db.addUserData(FirebaseAuth.instance.currentUser.uid, {
                                  "first name": first_name_controller.text.trim(),
                                  "last name": last_name_controller.text.trim(),
                                });
                                FirebaseAuth.instance.signOut();
                                saving = false;
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      curve: Curves.bounceOut,
                                      type: PageTransitionType.rightToLeftWithFade,
                                      duration: Duration(milliseconds: 1000),
                                      alignment: Alignment.topCenter,
                                      child: SignIn(),
                                    ));
                              }).catchError((error){
                                setState(() {
                                  saving = false;
                                });
                                Fluttertoast.showToast(
                                    msg: "$error",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 3,
                                    backgroundColor: Colors.red[400],
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              });

                            }
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),


                    SizedBox(height: 40,),
                    RichText(
                      text: TextSpan(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(text: "By creating an account you agree to our \n "),
                            TextSpan(text: "Terms of Service ",style: TextStyle(color: basicColor)),
                            TextSpan(text: "and "),
                            TextSpan(text: "Privacy Policy",style: TextStyle(color: basicColor)),

                          ]
                      ),
                    ),








                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

