import 'package:brew_crew/shared/common.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
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
            decoration: textFieldDecoration.copyWith(
                hintText: "Enter your name"),
            validator: (val) {
              if(val == null || val.isEmpty){
                return "Name can't be null";
              };
              return null;
            } ,
            onChanged: (val) => _currentName = val,
          ),
          SizedBox(height: 20),
          DropdownButtonFormField(
            decoration: textFieldDecoration,
            initialValue: _currentSugars,
              items: sugars.map((sugar){
                return DropdownMenuItem(
                    value: sugar,
                    child: Text("$sugar sugars"),
                );
              }).toList(),
              onChanged: (val) => _currentSugars = val!
          ),
          SizedBox(height: 20),
          Slider(
            min: 100,
              max: 900,
              divisions: 8,
              value: _currentStrength.toDouble(),
              onChanged: (val) => setState(() {
                _currentStrength = val.round();
              }),
          activeColor: Colors.brown[_currentStrength],
          inactiveColor: Colors.brown[_currentStrength],
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async{
            print(_currentStrength);
            print(_currentSugars);
            print(_currentName);
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
}