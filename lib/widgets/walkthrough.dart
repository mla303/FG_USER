import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:flutter/material.dart';


class myWalkthrough extends StatefulWidget {
  String title;
  String content;
  String image1;
  String image2;


  myWalkthrough(
      {this.title,
        this.content,
        this.image1,
        this.image2
      });

  @override
  WalkthroughState createState() {
    return new WalkthroughState();
  }
}

class WalkthroughState extends State<myWalkthrough>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 800));
    animation = new Tween(begin: -250.0, end: 0.0).animate(new CurvedAnimation(
        parent: animationController, curve: Curves.easeInOut));

    animation.addListener(() => setState(() {}));

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Transform(
          transform:
          new Matrix4.translationValues(0, 2.0, 6.0),
          child: new Image(
            image: AssetImage(widget.image1),
            height: MediaQuery.of(context).size.height/6,
          ),
        ),

        Transform(
          transform:
          new Matrix4.translationValues(0, 2.0, 6.0),
          child: new Image(
            image: AssetImage(widget.image2),
            // height: MediaQuery.of(context).size.height/15,
          ),
        ),

        SizedBox(height: 100,),

        Material(
          color: Colors.transparent,
          child: new Transform(
            transform:
            new Matrix4.translationValues(animation.value, 0.0, 0.0),
            child: new Text(
              widget.title,
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),

        SizedBox(height: 10,),


        Material(
          color: Colors.transparent,
          child: new Transform(
            transform:
            new Matrix4.translationValues(animation.value, 0.0, 0.0),
            child: new Text(widget.content,
                softWrap: true,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    color: Colors.grey)),
          ),
        ),

      ],
    );
  }
}