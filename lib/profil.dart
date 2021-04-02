import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'main.dart';

class ProfilPage extends StatelessWidget {
  final FirebaseUser user;

  ProfilPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 95.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
          },
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle: true,
        title: Text(
          "Profil",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: RaisedButton(
            child: new Text("Logout"),
            color: Colors.orange,
            onPressed: () async {
              await AuthServices.signOut();
            }),
      ),
    );
  }
}
