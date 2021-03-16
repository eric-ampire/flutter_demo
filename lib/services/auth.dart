import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class Auth {
  User get currentUser;
  Future<User> signInAnonymously();
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<void> signOut();
  Stream<User> authStateChanges();
}

class MainAuth implements Auth {

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  User get currentUser => _auth.currentUser;

  @override
  Future<User> signInAnonymously() async {
    final result = await _auth.signInAnonymously();
    return result.user;
  }

  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final userAuth = await googleUser.authentication;
      if (userAuth.accessToken != null) {
        final authCredential = GoogleAuthProvider.credential(
          accessToken: userAuth.accessToken,
          idToken: userAuth.idToken
        );
        final authResult = await _auth.signInWithCredential(authCredential);
        return authResult.user;
      } else {
        throw FirebaseAuthException(message: "Auth Abord");
      }
    } else {
      throw FirebaseAuthException(message: "Auth Abord");
    }
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    final facebookAuth = FacebookLogin();

    await facebookAuth.logOut();
    await googleSignIn.signOut();
    await _auth.signOut();
  }

  @override
  Stream<User> authStateChanges() => _auth.authStateChanges();

  @override
  Future<User> signInWithFacebook() async {
    final facebookAuth = FacebookLogin();
    final result = await facebookAuth.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email
    ]);

    switch (result.status) {
      case FacebookLoginStatus.Success:
        final accessToken = result.accessToken.token;
        final credential = FacebookAuthProvider.credential(accessToken);
        final authResult = await _auth.signInWithCredential(credential);
        return authResult.user;
        break;
      case FacebookLoginStatus.Cancel:
        throw FirebaseAuthException(message: "Auth Abord");
        break;
      case FacebookLoginStatus.Error:
        throw FirebaseAuthException(message: result.error.developerMessage);
        break;
      default:
        throw UnimplementedError();
    }
  }
}