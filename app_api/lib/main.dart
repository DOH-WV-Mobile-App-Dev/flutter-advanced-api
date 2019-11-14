import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _formKey = GlobalKey<FormState>();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                        onPressed: () => print("Hello"),
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
