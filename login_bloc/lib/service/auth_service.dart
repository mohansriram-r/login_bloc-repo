import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<String> resetPssword({required String email}) async {
    try {
      if (email.isEmpty) {
        return 'Email field is empty';
      }
      await _auth.sendPasswordResetEmail(email: email);
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        return 'Invalid email address';
      } else if (e.code == 'user-not-found') {
        return 'No user found with this email';
      } else {
        return 'Failed to send password reset email: ${e.message}';
      }
    } catch (e) {
      return 'An error occurred: $e';
    }
  }

  Future<String> signOut() async {
    try {
      await _auth.signOut();
      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        return 'success';
      } else {
        return 'Fill all the fields';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        return 'Invalid email address';
      } else if (e.code == 'user-not-found') {
        return 'No user found with this email';
      } else if (e.code == 'wrong-password') {
        return 'Incorrect password';
      } else if (e.code == 'invalid-credential') {
        return 'Invalid credentials provided';
      } else {
        return 'Failed to sign in: ${e.code} - ${e.message}';
      }
    } catch (e) {
      return 'An error occurred: $e';
    }
  }

  Future<String> createUser({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return 'success';
      } else {
        return 'Fill all the fields';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Email is already in use';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email address';
      } else if (e.code == 'weak-password') {
        return 'Weak password';
      } else {
        return 'Failed to create user: ${e.message}';
      }
    } catch (e) {
      return 'An error occurred: $e';
    }
  }

  Future<String> signInGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) {
        return "Google sign-in aborted";
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);

      await _auth.signInWithCredential(credential);

      return "success";
    } on FirebaseAuthException catch (e) {
      return 'Failed to sign in with Google: ${e.message}';
    } catch (e) {
      return 'An error occurred: $e';
    }
  }
}
