import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
  final auth = Auth();
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Brew Crew"),
        backgroundColor: Colors.brown[400],
        actions: [
          ElevatedButton.icon(
              onPressed: () async{
                await auth.signOut();
              },
              label: Text("LogOut"),
              icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
