import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getUser() {
    String user = _auth.currentUser!.email.toString();
    return user;
  }

  Future<void> resetPssword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<String> signOut() async {
    String res = "";
    try {
      await _auth.signOut();
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    String res = '';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        res = 'success';
      } else {
        res = 'Fill all the fields';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> createUser({
    required String email,
    required String password,
  }) async {
    String res = '';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'success';
      } else {
        res = 'Fill all the fields';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> signInGoogle() async {
    String res = '';
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);

      await _auth.signInWithCredential(credential);

      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
