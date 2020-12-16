import 'dart:io';

import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';




class contactUs extends StatefulWidget {
  @override
  _contactUsState createState() => new _contactUsState();
}

class _contactUsState extends State<contactUs> {

  @override
  Widget build(BuildContext context) {

    String text1 = "Contact Us";

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



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

      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
           
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                SizedBox(height: 20,),

                Expanded(
                  flex: 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          text1,
                          // textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                              color: Colors.black,
                              fontSize: 18
                          ),

                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 5,

                        ),
                        SizedBox(height: 15,),


                        Row(
                          children: [
                            Icon(Icons.email, color: Colors.grey,),
                            SizedBox(width: 12,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: 12
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,

                                ),
                                SizedBox(height: 1,),
                                Text(
                                  "palmhenrik97@gmail.com",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: 12
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,

                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Icon(Icons.phone, color: Colors.grey,),
                            SizedBox(width: 12,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone No.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: 12
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,

                                ),
                                SizedBox(height: 1,),
                                Text(
                                  "+46736210873",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: 12
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,

                                ),
                              ],
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),



              ],
            ),
          ],
        ),
      ),
    );
  }



}


