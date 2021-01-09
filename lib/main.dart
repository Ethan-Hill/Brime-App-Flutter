import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brime App',
      home: MyHomePage(title: 'Welcome'),
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
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Center(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            const Color.fromRGBO(20, 21, 34, 1),
            const Color.fromRGBO(35, 42, 78, 1),
            const Color.fromRGBO(20, 21, 34, 1),
          ])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: NetworkImage('https://i.imgur.com/YoP5BOy.png'),
            ),
            SizedBox(height: 10),
            Text(
              'Brime Live',
              style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            ElevatedButton(
              child: Text('Open route'),
              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
            ),
          ],
        ),
      ),
    )));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset(0.0, 0.0);
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomForm(),
    );
  }
}

final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color.fromRGBO(20, 21, 34, 1),
      const Color.fromRGBO(35, 42, 78, 1),
      const Color.fromRGBO(20, 21, 34, 1),
    ]).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        body: Container(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            const Color.fromRGBO(20, 21, 34, 1),
            const Color.fromRGBO(35, 42, 78, 1),
            const Color.fromRGBO(20, 21, 34, 1),
          ])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: NetworkImage('https://i.imgur.com/YoP5BOy.png'),
            ),
            SizedBox(height: 50),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.pink)),
                          labelText: 'Email address',
                          labelStyle: new TextStyle(color: Colors.pink)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
