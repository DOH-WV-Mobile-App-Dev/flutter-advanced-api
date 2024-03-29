import 'dart:convert';

import 'package:app_api/models/auth.dart';
import 'package:app_api/pages/home.dart';
import 'package:app_api/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vibration/vibration.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<Auth> auth;
  bool _userIsAuth = false;
  String _userEmail;
  String _userPassword;

  Future<Auth> getAuth(String email, String pass) async {
    String url = 'http://172.16.3.189:5000/auth?email=$email&pass=$pass';
    print(url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Auth auth = Auth(validation: data["validation"]);
      if (auth.validation) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => new OnBoardingPage()),
        );
      }else{
        print("Validation error");
      }
      print(auth.validation);
      setState(() {
        _userIsAuth = auth as bool;
      });
    }
  }

  void loggedIn(context) {
    Vibration.vibrate(duration: 5000);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => new OnBoardingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Hero(
              tag: 'hero',
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30),
                child: CircleAvatar(
                  radius: 50.0,
                  child: Image.asset('lib/assets/logo.png'),
                ),
              )),
          new Text(
            "DOH Connect!",
            textScaleFactor: 2.0,
          ),
          new Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: new InputDecoration(
                        hintText: null,
                        labelText: 'User Email',
                        hasFloatingPlaceholder: true,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) => _userEmail = value.trim(),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: new InputDecoration(
                        hintText: null,
                        labelText: 'Password',
                        hasFloatingPlaceholder: true,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) => _userPassword = value.trim(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: MaterialButton(
                        onPressed: () {
                          final form = _formKey.currentState;
                          form.save();
                          getAuth(Uri.encodeComponent(_userEmail),
                              _userPassword);
                          // final snackBar = SnackBar(
                          //   content: Text('Logged In'),
                          //   action: SnackBarAction(
                          //     label: 'OK',
                          //     onPressed: () => loggedIn(context),
                          //   ),
                          // );

                          // Find the Scaffold in the widget tree and use
                          // it to show a SnackBar.
                          // _scaffoldKey.currentState.showSnackBar(snackBar);
                        },
                        color: Colors.lightGreen,
                        child: Text('Login'),
                      ),
                    )
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
