import 'package:app_api/pages/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  
  void loggedIn(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => new HomePage()),
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
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: MaterialButton(
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: Text('Logged In'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: ()=>loggedIn(context),
                            ),
                          );

                          // Find the Scaffold in the widget tree and use
                          // it to show a SnackBar.
                          _scaffoldKey.currentState.showSnackBar(snackBar);
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
