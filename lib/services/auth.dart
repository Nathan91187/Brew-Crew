
import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  UserModel? userReturn(User? user){
    if(user == null){
      return null;
    }
    return UserModel(uid: user.uid);
  }
  final auth = FirebaseAuth.instance;
  Stream <UserModel?> get user{
    return auth.authStateChanges().map(userReturn);
  }
  Future anonSignin () async {
    try{
       final result = await auth.signInAnonymously();
       final user = result.user;
       if(user == null){
         return null;
       }
       return userReturn(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signOut() async{
    try{
      await auth.signOut();
    }
    catch(e){
      return e.toString();
    }
  }
  Future registerWithEmailAndPassword(String email, String password) async{
    try {
      final result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return userReturn(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      final result = await auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return userReturn(user);
    }
    catch(e){
      return null;
    }
  }
}