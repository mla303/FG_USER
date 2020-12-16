import 'package:firebase_auth/firebase_auth.dart';

class Authentication {


 Future<void> createUser(String email,String password) async{
   await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }



}