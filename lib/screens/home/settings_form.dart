import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/home/strength_slider.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/common.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1', '2', '3', '4'];
  String _currentName = '' ;
  String _currentSugars = '0';
  int _currentStrength = 100;
  bool initialDataProvidedToCurrentValues = false;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    if(user == null){
      return Loading();
    }
    return StreamBuilder<UserData>(
      stream: DatabaseSetup(uid: user.uid).userData,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        if (asyncSnapshot.hasError) {
          return Text(
            'Error: ${asyncSnapshot.error}'
          );
        }
        if(asyncSnapshot.hasData && !initialDataProvidedToCurrentValues){
          _currentName = asyncSnapshot.data!.name;
          _currentSugars = asyncSnapshot.data!.sugars;
          _currentStrength = asyncSnapshot.data!.strength;
          initialDataProvidedToCurrentValues = true;
        }
        if(asyncSnapshot.hasData){
          return Form(
            key: _formkey,
            child: Column(
              children: [
                Text(
                  "Update your brew preferences",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                TextFormField(
                  initialValue: _currentName,
                  decoration: textFieldDecoration.copyWith(
                      hintText: "Enter your name"),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Name can't be null";
                    };
                    return null;
                  },
                  onChanged: (val) => _currentName = val,
                ),
                SizedBox(height: 20),
                DropdownButtonFormField(
                    decoration: textFieldDecoration,
                    initialValue: _currentSugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text("$sugar sugars"),
                      );
                    }).toList(),
                    onChanged: (val) { if(val != null){_currentSugars = val;}}
                ),
                SizedBox(height: 20),
                StrengthSlider(
                  initialStrength: _currentStrength,
                  onChanged: (value){
                    _currentStrength = value;
                  }),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if(!_formkey.currentState!.validate()){
                      return;
                    }
                      await DatabaseSetup(uid: asyncSnapshot.data!.uid).updateUserData(
                          _currentName, _currentSugars, _currentStrength
                      );
                      Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink
                  ),
                  child: Text(
                    "Update",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          );
        }
        else{
          return Loading();
        }
      }
    );
  }
}