import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tower Takeover',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tower Takeover'),
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

  void hold() {
    print("press");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Stack(
        children: <Widget>[
//          red
          Container(
            alignment: Alignment(-2, -1),
            child: Center(
              child: ButtonBar(
                children: <Widget>[
                  Text("Blue Cubes"),
                  MaterialButton(
                    color: Colors.orange,
                    child: Text("+",
                        style: new TextStyle(fontSize: 20)),
                    onPressed: hold,
                  ),
                  MaterialButton(
                    color: Colors.green,
                    child: Text("+",
                        style: new TextStyle(fontSize: 20)),
                    onPressed: hold,
                  ),
                  MaterialButton(
                    color: Colors.purple,
                    child: Text("+",
                        style: new TextStyle(fontSize: 20)),
                    onPressed: hold,
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
