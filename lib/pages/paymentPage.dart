import 'package:carousel_slider/carousel_slider.dart';
import 'package:fg_trcknlgy/pages/ImageDetail.dart';
import 'package:fg_trcknlgy/pages/signIn.dart';
import 'package:fg_trcknlgy/pages/videoDetail.dart';
import 'package:fg_trcknlgy/widgets/ImageSlider.dart';
import 'package:fg_trcknlgy/widgets/imageCategory.dart';
import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:fg_trcknlgy/widgets/videosCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:page_transition/page_transition.dart';

class paymentPage extends StatefulWidget {




  @override
  _paymentPageState createState() => new _paymentPageState();
}



class _paymentPageState extends State<paymentPage> {


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
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("CARD NUMBER*"),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "9235 4325 3456 0000",
                      ),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Text("EXPIRY DATE*"),
                    TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: "MM/YY",
                      ),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Text("CARD CODE (CVC)*"),
                    TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: "CVC",
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: <Widget>[

                  // CheckboxGroup(
                  //     labels:["",
                  //     ],
                  //     onSelected: (List<String> checked) => print(checked.toString())
                  // ),
                  new Text("SAVE PAYMENT INFORMATION TO MY ACCOUNT FOR FURTHER PURCHASES",
                    style: TextStyle(fontSize: height/100),)
                ],
              ),


              Container(
                width: width/1.2,
                height: height/15,
                child: RaisedButton(

                  onPressed: () => {

                  Navigator.pushReplacement(
                  context,
                  PageTransition(
                  curve: Curves.bounceOut,
                  type: PageTransitionType.rightToLeftWithFade,
                  duration: Duration(milliseconds: 800),
                  alignment: Alignment.topCenter,
                  child:
                  // imgdetail == true
                  //     ?
                  videoDetail("","","","")
                    // : imageDetail(),
                  ))

                  },
                  textColor: Colors.white,
                  color: basicColor,
                  child: Text('Place Order',style: TextStyle(color: Colors.white,fontSize: height/40),),
                ),
              ),
            ],
          ),
        ),

      ),

    );
  }
}

List videosList = [

  VideoCatg(
      SongName:"Nose pivot | spinning your scooter",
      imgUrl: "Images/slider.png"
  ),

  VideoCatg(
      SongName:"Nose pivot",
      imgUrl: "Images/slider.png"
  ),

];


class VideoCatg{
  String SongName;
  String imgUrl;

  VideoCatg({this.SongName,this.imgUrl,});

}