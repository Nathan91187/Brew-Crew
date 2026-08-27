import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/common.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({
    super.key,
    required this.toggleView
  });

  @override
  State<SignIn> createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  final authenticate = Authenticate();
  final _formkey = GlobalKey<FormState>();
  final auth = Auth();
  String email = '';
  String pass = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        leading: null,
        title: Text("Sign in to Brew Crew",
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
              onPressed: (){
              widget.toggleView();
              },
              icon: Icon(
                  Icons.person,
                  color: Colors.black,
              ),
              label: Text(
                "Register",
                style: TextStyle(
                  color: Colors.black
                ),
              ),

              )
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
                decoration: textFieldDecoration.copyWith(hintText: "Email"),
                validator: (val) {
                  if(val == null || val.isEmpty){
                    return "Email can't be empty";
                  }
                },
                onChanged: (val){
                      email = val;
                },
              ),
              SizedBox(
                height: 20
              ),
              TextFormField(
                decoration: textFieldDecoration.copyWith(hintText: "Password"),
                validator: (val) {
                  if(val == null || val.length < 6){
                    return 'password has to be at least 6 characters';
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
                  onPressed: () async{
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      final user = await auth.signInWithEmailAndPassword(email, pass);
                      if(user == null){
                        setState(() {
                          error = 'No user with the specified credentials!';
                          loading = false;
                        });
                      }
                    }
                  },
                child: Text(
                  "Sign in",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red
                ),
              )
            ],
          ),
        ),
      )
    );
}
}
