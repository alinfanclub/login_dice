import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 50)),
                Center(
                  child: Image(
                    image: AssetImage('image/chef.gif'),
                    width: 170,
                    height: 190,
                  ),
                ),
                Form(
                  child: Theme(
                      data: ThemeData(
                          primaryColor: Colors.teal,
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(color: Colors.teal))),
                      child: Container(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            TextField(
                              decoration:
                                  InputDecoration(labelText: 'enter dice'),
                              keyboardType: TextInputType.emailAddress,
                              controller: controller,
                            ),
                            TextField(
                              decoration:
                                  InputDecoration(labelText: 'enter password'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              controller: controller2,
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            ButtonTheme(
                                minWidth: 100,
                                height: 50,
                                child: RaisedButton(
                                  color: Colors.orangeAccent,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 35.0,
                                  ),
                                  onPressed: () {
                                    if (controller.text == "dice" &&
                                        controller2.text == "1234") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Dice()));
                                    } else if (controller.text != "dice" &&
                                        controller2.text == "1234") {
                                      showSnackBar3(context);
                                    } else if (controller.text == "dice" &&
                                        controller2.text != "1234") {
                                      showSnackBar2(context);
                                    } else {
                                      showSnackBar(context);
                                    }
                                    ;
                                  },
                                )),
                          ],
                        ),
                      )),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text('단디 확인해라', textAlign: TextAlign.center),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}

void showSnackBar2(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text('비번틀림', textAlign: TextAlign.center),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}

void showSnackBar3(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text('아이디틀림', textAlign: TextAlign.center),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}

class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game'),
      ),
      body: Center(
        child: Text('Dice Game Page'),
      ),
    );
  }
}
