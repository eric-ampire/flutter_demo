
import 'package:flutter/material.dart';
import 'package:flutter_demo/services/auth.dart';
import 'package:flutter_demo/ui/custom/custom_elevated_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({
    Key key,
    @required this.auth,
  }) : super(key: key);

  final Auth auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print("Error $e");
    }
  }

  Future<void> _signWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Time tracker App"),
        elevation: 2.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 48),
            CustomElevatedButton(
              imageAsset:
                  "/Users/ericampire/Workspace/Programming/demo/flutter_demo/images/google-logo.png",
              color: Colors.white,
              textColor: Colors.black,
              onPressed: _signWithGoogle,
              text: "Sign In with Google",
            ),
            SizedBox(height: 10),
            CustomElevatedButton(
              imageAsset:
                  "/Users/ericampire/Workspace/Programming/demo/flutter_demo/images/facebook-logo.png",
              color: Color(0xFF334D92),
              textColor: Colors.white,
              onPressed: () {},
              text: "Sign In With Facebook",
            ),
            SizedBox(height: 10),
            CustomElevatedButton(
              color: Colors.teal[700],
              textColor: Colors.white,
              onPressed: () {},
              text: "Sign In With Email",
            ),
            SizedBox(height: 10),
            Text(
              "Or",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            CustomElevatedButton(
              color: Colors.lime[300],
              textColor: Colors.black,
              onPressed: _signInAnonymously,
              text: "Go Anonymous",
            ),
          ],
        ),
      ),
    );
  }
}
