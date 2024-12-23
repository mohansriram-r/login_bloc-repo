import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

        res = 'sucess';
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
        res = 'sucess';
      }else {
        res = 'Fill all the fields';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
