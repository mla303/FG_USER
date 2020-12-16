import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fg_trcknlgy/pages/profile.dart';
import 'package:fg_trcknlgy/widgets/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '';




class editProfile extends StatefulWidget {
  String  person_name;
  String photo_url;
  editProfile(this.person_name,this.photo_url);
  @override
  _editProfileState createState() => new _editProfileState();
}

class _editProfileState extends State<editProfile> {
  bool name_changed;
String photo_url;
  TextEditingController name_controller =TextEditingController();
  TextEditingController password_controller =TextEditingController();
  TextEditingController new_password_controller =TextEditingController();
  TextEditingController confirm_password_controller =TextEditingController();
  var image_file;
  String personName;
  @override
  void initState() {
    personName=widget.person_name;
    photo_url=widget.photo_url;


    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    String text1 = "Personal Info";




    bool _currentpass = true;
    bool _newpass = true;
    bool _renewpass = true;
    void _toggle() {
      setState(() {
        _currentpass = !_currentpass;
      });
    }
    void _toggle1() {
      setState(() {
        _newpass = !_newpass;
      });
    }
    void _toggle2() {
      setState(() {
        _renewpass = !_renewpass;
      });
    }


    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: Colors.white,
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
            // automaticallyImplyLeading: false
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: width/1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 20,),
                  Center(
                    child: Stack(
                      children: [

                        CircleAvatar(
                          backgroundImage: photo_url==null?AssetImage("Images/profile.jpg"):NetworkImage(photo_url),
                          // minRadius: 20,
                          radius: 45,
                          // borderRadius: BorderRadius.circular(20.0),
                          // child: Image.asset(
                          //   "Images/profile.jpg",
                          //   height: 92,
                          //   width: 92,
                          //   fit: BoxFit.cover,
                          // )
                        ),
                        Positioned(
                            top: 60,
                            left: 70,
                            child: GestureDetector(
                                onTap: (){
                                  ImagePicker().getImage(source: ImageSource.gallery).then((img) {
                                    setState(() {
                                      image_file=img;
                                    });
                                  });
                                },
                                child: Icon(Icons.camera_alt,size: 20,color: Colors.white,)))
                      ],

                    ),
                  ),


                  SizedBox(height: 10,),
                  Divider(),
                  SizedBox(height: 15,),

                  Text(
                    text1,
                    // textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                        color: Colors.black,
                        fontSize: 16
                    ),

                    // overflow: TextOverflow.ellipsis,
                    // maxLines: 5,

                  ),
                  SizedBox(height: 15,),


                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.grey,),
                      SizedBox(width: 12,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                height: 1.3,
                                fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,

                          ),
                          // SizedBox(height: 0,),
                          Container(
                            width: width/1.4,
                            child: TextField(
                              controller: name_controller,
                              onChanged: (txt){
                                   name_changed=true;
                              },
                              style: TextStyle(
                                  color: basicColor,
                                  fontSize: 14
                              ),

                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                              cursorColor: basicColor,
                              decoration: new InputDecoration(
                                  contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                                  border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(20.0),
                                      ),
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(20.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(20.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),


                                  filled: true,
                                  hintStyle: new TextStyle(color: Colors.grey[800],fontSize: 14),
                                  hintText: personName,
                                  fillColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.lock, color: Colors.grey,),
                      SizedBox(width: 12,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current Password",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                height: 1.3,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,

                          ),
                          // SizedBox(height: 1,),
                          Container(
                            width: width/1.4,
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
                              obscureText: _currentpass,
                              decoration: new InputDecoration(
                                  contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),

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
                                  hintStyle: new TextStyle(color: Colors.grey[500], fontSize: 14),
                                  hintText: "enter current password",
                                  fillColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.lock, color: Colors.grey,),
                      SizedBox(width: 12,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Password",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                height: 1.3,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,

                          ),
                          // SizedBox(height: 1,),
                          Container(
                            width: width/1.4,
                            child: TextField(
                              controller: new_password_controller,
                              style: TextStyle(
                                  color: basicColor,
                                  fontSize: 14
                              ),

                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              onSubmitted: (_) => FocusScope.of(context).unfocus(),

                              cursorColor: basicColor,
                              obscureText: _newpass,
                              decoration: new InputDecoration(
                                  contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),

                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    iconSize: 18,
                                    color: basicColor,
                                    onPressed: _toggle1,
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
                                  hintStyle: new TextStyle(color: Colors.grey[500], fontSize: 14),
                                  hintText: "enter new password",
                                  fillColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.lock, color: Colors.grey,),
                      SizedBox(width: 12,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Re-enter new Password",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                height: 1.3,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,

                          ),
                          // SizedBox(height: 1,),
                          Container(
                            width: width/1.4,
                            child: TextField(
                              controller: confirm_password_controller,
                              style: TextStyle(
                                  color: basicColor,
                                  fontSize: 14
                              ),

                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              onSubmitted: (_) => FocusScope.of(context).unfocus(),

                              cursorColor: basicColor,
                              obscureText: _renewpass,
                              decoration: new InputDecoration(
                                  contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),

                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    iconSize: 18,
                                    color: basicColor,
                                    onPressed: _toggle2,
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
                                  hintStyle: new TextStyle(color: Colors.grey[500], fontSize: 14),
                                  hintText: "re-enter new Password",
                                  fillColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Divider(),
                  SizedBox(height: 15,),



                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.height/18,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                              color: basicColor,
                            )),
                        color: basicColor,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(8.0),
                        onPressed: ()  async{
                        // Navigator.pop(context);

                          bool name_updated=false;
                          if(image_file!=null)
                          {

                          Fluttertoast.showToast(msg: "Updating profile pic");
                          Reference reference = FirebaseStorage.instance.ref().child("Users/profilePics/${widget.person_name}");
                          UploadTask uploadTask = reference.putFile(File(image_file.path));
                          uploadTask.then((val) {
                          reference.getDownloadURL().then((url) {
                          name_controller.text.trim()!=""?
                          FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update({
                          "photo url":url
                          }).then((value) {
                          Fluttertoast.showToast(msg: "Profile pic updated");
                          })://ternary operator
                          FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update({
                          "photo url":url,
                          "name":name_controller.text.trim()
                          }).then((value) {
                          name_updated=true;
                          Fluttertoast.showToast(msg: "Profile pic and name updated");
                          });
                          });
                          });
                          }
                          if(name_controller.text.trim()!=""&&!name_updated)
                          {
                          Fluttertoast.showToast(msg: "Name password");
                          FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update({"name":name_controller.text.trim()}).then((value) {
                          Fluttertoast.showToast(msg: "Name updated");
                          });
                          }

                          if(new_password_controller.text.trim()!="")
                          {

                          FirebaseAuth.instance.signInWithEmailAndPassword(email: FirebaseAuth.instance.currentUser.email, password: password_controller.text.trim()).then((user) {
                          print(user);
                          if(new_password_controller.text.trim()==confirm_password_controller.text.trim())
                          {
                          Fluttertoast.showToast(msg: "Updating password");
                          FirebaseAuth.instance.currentUser.updatePassword(new_password_controller.text.trim()).then((value) {

                          Fluttertoast.showToast(msg: "Password updated");
                          });
                          }
                          else
                          {
                          Fluttertoast.showToast(msg: "Please enter same password in confirm password field",textColor: Colors.white,timeInSecForIosWeb: 3,backgroundColor: Colors.red[400]);
                          }

                          }).catchError((e){
                          if(e.message=="The password is invalid or the user does not have a password.")
                          {
                          Fluttertoast.showToast(msg: "Incorrect password",backgroundColor: Colors.red[400]);
                          }
                          else
                          Fluttertoast.showToast(msg: e.message);
                          });




                          //
                          // bool is_correct= await checkPassword();
                          // if(is_correct)
                          //   {
                          //     //update password
                          //     if(new_password_controller.text.trim()==confirm_password_controller.text.trim())
                          //       {
                          //         Fluttertoast.showToast(msg: "Updating password");
                          //         FirebaseAuth.instance.currentUser.updatePassword(new_password_controller.text.trim()).then((value) {
                          //
                          //           Fluttertoast.showToast(msg: "Password updated");
                          //         });
                          //       }
                          //     else
                          //       {
                          //         Fluttertoast.showToast(msg: "Please confirm your password carefully",textColor: Colors.red[400],timeInSecForIosWeb: 3);
                          //       }
                          //   }
                          // else{
                          //   Fluttertoast.showToast(msg: "Incorrect password",textColor: Colors.red[400]);
                          // }
                          }
                          if(name_controller.text.trim()==""&&image_file==null&&new_password_controller.text.trim()=="")
                          {
                          // print("Hello world meta data: ${FirebaseAuth.instance.currentUser.refreshToken}");
                          // print("Hello world providor data: ${FirebaseAuth.instance.currentUser.providerData}");
                          Fluttertoast.showToast(msg: "Nothing to update");
                          }



                        },
                        child: Text(
                          "Update Profile",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}


