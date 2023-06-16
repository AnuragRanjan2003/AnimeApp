import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_projects/utils/resource.dart';

class Authenticate {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnonymous() async {
    print("sign in anonymous");
    try {
      dynamic result = await _auth.signInAnonymously();
      print("$result");
      return result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<Resource> signInEmail(String email, String pass) async {
    if (email.isEmpty) {
      return Future.value(const Failure("email to Short"));
    }
    if (pass.length <= 6) {
      return Future.value(const Failure("Password to Short"));
    }
    try {
      var result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      print("$result");
      return Future.value(Success(result));
    } catch (e) {
      print(e.toString());
      return Future.value(Failure(e.toString()));
    }
  }

  Future<Resource> registerWithEmail(String email, String pass) async {
    if (email.isEmpty) return Future(() => const Failure("email empty"));
    if (pass.length <= 6) {
      return Future(
          () => const Failure("password must be at lest 6 characters"));
    }
    try {
      dynamic result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      print(result);
      return Future(() => Success(result));
    } catch (e) {
      print(e.toString());
      return Future(() => Failure(e.toString()));
    }
  }
}
