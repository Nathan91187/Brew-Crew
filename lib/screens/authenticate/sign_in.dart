import 'package:brew_crew/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Sign in to Brew Crew"),
        backgroundColor: Colors.brown[400],

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
            onPressed: () async{
              final user = await auth.anonSignin();
              if(user == null){
                print("error signing in");
              }
              else{
                print("user signed in");
                print(user);
              }
            },
            child: Text("Sign in Anonymously")
        ),
      ),
    );
}
}
