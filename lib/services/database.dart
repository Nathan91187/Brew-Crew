import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseSetup {
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');
}