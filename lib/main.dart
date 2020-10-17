import 'package:flutter/material.dart';
import 'package:logapp/models/user.dart';
import 'package:logapp/screen/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logapp/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
