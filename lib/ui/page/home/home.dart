import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/services/auth.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({
    Key key,
    @required this.auth,
  }) : super(key: key);

  final Auth auth;

  void _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          TextButton(
            onPressed: _signOut,
            child: Text(
              "Logout",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
