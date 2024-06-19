import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // for storing data in firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // for Authenticatiion
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //for signUp
  Future<String> signUpUser(
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
      res = "success";
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  // log in
  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some Error Occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please Enter All The Fields";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  //for logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
