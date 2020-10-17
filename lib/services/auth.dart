import 'package:firebase_auth/firebase_auth.dart';
import 'package:logapp/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebaseuser
  Users _userFromFireBase(User user) {
    return user != null ? Users(uid: user.uid) : null;
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
}
