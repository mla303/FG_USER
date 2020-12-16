import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff000000),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
            image: AssetImage("Images/slider.png"),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: "5 Skateboarding Tricks You Can \n Learn In ...",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ])),
        ),
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff000000),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
            image: AssetImage("Images/slider.png"),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: "5 Skateboarding Tricks You Can \n Learn In ...",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ])),
        ),
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff000000),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
            image: AssetImage("Images/slider.png"),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: "5 Skateboarding Tricks You Can \n Learn In ...",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ])),
        ),
      ),
    );
  }
}
