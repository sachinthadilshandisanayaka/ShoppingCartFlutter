import 'package:firebase_auth/firebase_auth.dart';
import 'package:logapp/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebaseuser
  Users _userFromFireBase(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }
  // auth change user stream

  Stream<Users> get user {
    return _auth.authStateChanges().map((User user) => _userFromFireBase(user));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return _userFromFireBase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth
          .signOut(); // future function name 'signOut' and this 'signOut' are different
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
