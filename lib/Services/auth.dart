import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // for storing data in firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // for Authenticatiion
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //for signUp
  Future<String> signUpuser(
      {required String email,
      required String password,
      required String name}) async {
    String res = "Some Exception Occured";

    try {
      // for registering user with firebase authentication with email andd password
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //for adding user to cloud store

      await _firestore.collection("users").doc(credential.user!.uid).set({
        'name': name,
        'email': email,
        'uid': credential.user!.uid,
      });
      res = "Succesfully";
    } catch (e) {
      print(e.toString());
    }
    return res;
  }
}
