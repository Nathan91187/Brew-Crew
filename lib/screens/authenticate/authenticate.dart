import 'package:brew_crew/firebase_options.dart';
import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();


}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleSelection(){
    setState(() {
      showSignIn =  !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn == true){
      return SignIn(toggleView: toggleSelection,);
    }
    else{
      return Register(toggleView: toggleSelection,);
    }
  }
}
