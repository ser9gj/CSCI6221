import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutorly/models/user.dart';
import 'package:tutorly/services/database.dart';

class AuthService {

final FirebaseAuth _auth=FirebaseAuth.instance;

//creating user object with FirebaseUSer

User _userFromFirebaseUser(FirebaseUser user){

  return user != null? User(uid:user.uid ):null;
}

//auth change user with a stream

Stream<User> get user{

  return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  
  }

//sign in anom

Future signInAnom() async{

//try to do something, if doesnt work, catch the error

try{

  AuthResult result=await _auth.signInAnonymously();
  FirebaseUser user=result.user;
  return _userFromFirebaseUser(user);
  
}

catch(e){

  print(e.toString());
  return null;
}
}

//sign in with email & password

Future signInWithEmailAndPassword(String email, String password) async{

try{
  AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
  FirebaseUser user=result.user;
  return _userFromFirebaseUser(user);
  } catch(e){
    print(e.toString());
    return null;
  }

}

//register with email & password

Future registerWithEmailAndPassword(String email, String password) async{

try{
  AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  FirebaseUser user=result.user;

  await DatabaseService(uid: user.uid).updateUserData('first name','last name', 'major');
  return _userFromFirebaseUser(user);
  } catch(e){
    print(e.toString());
    return null;
  }

}

//sign out

Future signOut() async {
  try{
    return await _auth.signOut();
  } catch(e){
    print(e.toString());
    return null;
  }
}
}
