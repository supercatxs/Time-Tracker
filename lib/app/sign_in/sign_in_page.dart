import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/sign_in_button.dart';
import 'package:time_tracker/app/sign_in/social_sign_in_butoon.dart';

class SignInPage extends StatelessWidget {

  const SignInPage({Key key, this.onSignIn}) : super(key: key);
  final void Function(User) onSignIn;



  Future<void> _signInGuest() async {
    try{
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      print("User ID: ${userCredentials.user.uid}");
    }
    catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Time Tracker"),
          elevation: 3.0,
        ),
        body: _buildContent(),
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign in",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 50.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: "Sign in with Google",
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {
              print("button was pressed");
            },
          ),
          SizedBox(height: 10),
          SocialSignInButton(
            assetName: "images/facebook-logo.png",
            text: "Sign in with Facebook",
            color: Colors.indigo,
            textColor: Colors.white,
            onPressed: () {
              print("button was pressed");
            },
          ),
          SizedBox(height: 10),
          SignInButton(
            text: "Sign in with Email",
            color: Colors.teal[700],
            textColor: Colors.white,
            onPressed: () {
              print("button was pressed");
            },
          ),
          Text("or",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
              )),
          SignInButton(
            text: "Guest",
            color: Colors.grey,
            textColor: Colors.black54,
            onPressed: _signInGuest,
          ),
        ],
      ),
    );
  }
}
