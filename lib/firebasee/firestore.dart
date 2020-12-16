import 'package:cloud_firestore/cloud_firestore.dart';

class DB{
  String user_ID;
  addUserData(String document_ID,Map<String ,dynamic> data){

    FirebaseFirestore.instance.collection("users").doc(document_ID).set(data);
  }
}