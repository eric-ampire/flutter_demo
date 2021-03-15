import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/services/auth.dart';
import 'package:flutter_demo/ui/page/home/home.dart';
import 'package:flutter_demo/ui/page/signin/signin.dart';

class LandingPageView extends StatelessWidget {
  const LandingPageView({Key key, @required this.auth}) : super(key: key);

  final Auth auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;
          if (user == null) {
            return SignInView(auth: auth);
          } else {
            return HomePageView(auth: auth);
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
