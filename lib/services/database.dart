import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
              strength: doc['strength'] ?? '',
              name: doc['name'] ?? '',
              sugars: doc['sugars'] ?? 0
          );
        }
    ).toList();
  }
  Stream <List<Brew>> get brews{
    return brewCollection.snapshots().map(brewListFromSnapshot);
  }
}