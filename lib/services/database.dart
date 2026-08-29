import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseSetup {

  String? uid;
  DatabaseSetup({
     this.uid
});
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');
  Future updateUserData(String name, String sugars, int strength) async{
    return await brewCollection.doc(uid).set(
      {
        'name': name,
        'sugars' : sugars,
        'strength' : strength
      }
    );
  }
  List <Brew> brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map(
        (doc) {
          return Brew(
              strength: doc['strength'],
              name: doc['name'],
              sugars: doc['sugars']
          );
        }
    ).toList();
  }
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){

    final data = snapshot.data() as Map<String, dynamic>;
    return UserData(
        uid: uid!,
        strength: data['strength'],
        name: data['name'],
        sugars: data['sugars']
    );
  }
  Stream <List<Brew>> get brews{
    return brewCollection.snapshots().map(brewListFromSnapshot);
  }
  Stream<UserData> get userData{
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}