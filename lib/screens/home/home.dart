import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
  final auth = Auth();
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    void showSettingsBottomSheet(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: SettingsForm()
        );
      });
    }
    return StreamProvider<List<Brew>?>.value(
      value: DatabaseSetup().brews, initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
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
                onPressed: () async{
                  return await auth.signOut();
                },
                label: Text(
                  "Sign Out",
                  style: TextStyle(
                      color: Colors.black
                  ),
                )),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[400],
                    elevation: 0
                ),
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                onPressed: (){
                  return showSettingsBottomSheet();
                },
                label: Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.black
                  ),
                )),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/coffee_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
            child: BrewList()
        ),
      ),
    );
  }
}
