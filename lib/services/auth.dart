
import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  UserModel uidReturn(User user){
    return UserModel(uid: user.uid);
  }
  final auth = FirebaseAuth.instance;
  Future anonSignin () async {
    try{
       final result = await auth.signInAnonymously();
       final user = result.user;
       if(user == null){
         return null;
       }
       return uidReturn(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}