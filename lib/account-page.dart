import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign-in-page.dart';

class AccountLayout extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final _auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text("Account Info"),
      ),
      body: Column(
        children: <Widget>[
          const Divider(height: 50),
          CircleAvatar(radius: 40, backgroundImage: NetworkImage(user.photoURL!)),
          const Divider(height: 50),
          Text("Name: " + user.displayName!),
          const Divider(height: 30),
          Text("Email: " + user.email!),
          const Divider(height: 250),
          SizedBox(
            height: 100,
            width: 100,
            child: TextButton (
              onPressed: () async {
                print("signed out");
                await _auth.signOut().then((value) => SignUpWidget());
              }, 
              child: Text("Sign Out", ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  elevation: 12.0,
              )
            )
          )
        ],
      )
    );
  }
}