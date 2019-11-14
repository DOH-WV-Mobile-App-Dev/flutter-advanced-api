import 'package:app_api/api/auth.dart';
import 'package:flutter/material.dart';
import 'package:app_api/pages/login.dart';
import 'package:app_api/pages/onboarding.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {

  @override
  void initState() {
    super.initState();
  }

  final bool auth = true;

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(auth){
      return new OnBoardingPage();
    }else{
      return new LoginPage();
    }
  }
}
