import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';
class Register extends StatefulWidget {
  final Function toggleView;
  const Register({
    super.key,
    required this.toggleView
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final auth = Auth();
  String email = '';
  String pass = '';
  String error = '';
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("Register to Brew Crew",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          actions: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[400],
                elevation: 0
              ),
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
                onPressed: (){
                  widget.toggleView();
                },
                label: Text(
                  "Sign in",
                  style: TextStyle(
                      color: Colors.black
                  ),
                )),

          ],
          backgroundColor: Colors.brown[400],

        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val) {
                    if(val == null){
                return 'email shouldn\'t be empty';
          }
              return null;
          },
                  onChanged: (val){
                    email = val;
                  },
                ),
                SizedBox(
                    height: 20
                ),
                TextFormField(
                  validator: (val) {
                    if(val == null || val.length < 6){
                      return 'password should be longer than 5 characters';
                    }
                    return null;
                  },
                  obscureText: true,
                  onChanged: (val){
                    pass = val;
                  },
                ),
                SizedBox(
                    height: 20
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink
                  ),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      final result = await auth.registerWithEmailAndPassword(email, pass);
                      if(result == null){
                        setState(() {
                          error = "Please feed a valid email";
                        });
                      }
                    }
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(error,
                style: TextStyle(
                  color: Colors.red,
                ),
                )
              ],
            ),
          ),
        )
    );
  }
}
