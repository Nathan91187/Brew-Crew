import 'package:flutter/material.dart';

import '../../services/auth.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
final auth = Auth();
String email = '';
String pass = '';
class _RegisterState extends State<Register> {
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
          backgroundColor: Colors.brown[400],

        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (val){
                    email = val;
                  },
                ),
                SizedBox(
                    height: 20
                ),
                TextFormField(
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
                  onPressed: (){
                    print(email + pass);
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
