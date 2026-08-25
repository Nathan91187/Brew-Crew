import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value (
        value: Auth().user,
        initialData: initialData,
        child: MaterialApp(
          home: Wrapper(),
        ),
}
