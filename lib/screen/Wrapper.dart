import 'package:flutter/material.dart';
import 'package:logapp/models/user.dart';
import 'package:logapp/screen/authenticate/Authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    print(user);

    return Authenticate();
  }
}
