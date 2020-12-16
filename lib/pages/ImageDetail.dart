import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class imageDetail extends StatefulWidget {
  String videoTitle;
  String videoDescp;
  String image_category;
  String imageUrl;
  imageDetail(
      this.image_category, this.imageUrl, this.videoTitle, this.videoDescp);
  @override
  _imageDetailState createState() => new _imageDetailState();
}

class _imageDetailState extends State<imageDetail> {
  // String videoTitle = "Nose pivot – Spinning your scooter";
  // String videoDescp = "A nose pivot is a really useful trick to have mastered and for a simple way to transition in to (and out of) fakie.Combine a handle bar push with forwards lean to shift your scooter onto its front wheel, and from there it’s just a case of turning around. Easy and useful – everyone’s a winner!";

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
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: height / 4,
                  width: width / 1.1,
                  decoration: BoxDecoration(
                      color: const Color(0xff000000),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.dstATop),
                        image: NetworkImage(widget.imageUrl),
                      )),
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.image_category} | ${widget.videoTitle}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
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
        ),
      ),
    );
  }
}
