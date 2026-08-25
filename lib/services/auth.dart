
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
}