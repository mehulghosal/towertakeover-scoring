import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}
//void main() => runApp(MyApp());

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

  Timer _timer;
  int _start = 105;

//  orange, green, purple
  List _towers = [1,1,1];
  List _cube = [0,0,0];

//  delta scores for cubes
  List _scores = [0,0,0];


  //i is the index, j is positive or negative
  void updateStack(int i, int j){
    setState(() {
      _cube[i] +=j;
      updateScores();
    });
  }

  void updateTower(int i, int j){
    setState(() {
      _towers[i] += j;
      updateScores();
    });
  }

  void updateScores(){
    setState(() {
      _scores = [_cube[0]*_towers[0], _cube[1]*_towers[1], _cube[2]*_towers[2],];
    });
  }

  void resetScore(){
    setState(() {
      _cube = [0,0,0];
      _towers = [1, 1, 1];
      updateScores();
    });
  }

  void startTimer(){
    if (_start<1){
      _start = 105;
    }
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
        (Timer timer) => setState(
            (){
              if (_start < 1){
                timer.cancel();
              }
              else{
                _start=_start-1;
              }
            }
        )
    );
  }

  void resetTimer(){
    setState(() {
      _start=10;
    });
  }

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    int align = -1;
    return Scaffold(

      body: new Stack(
        children: <Widget>[

//          delta cube values
          Container(
            child: Row(
              children: <Widget>[
                Text( _cube[0].toString(), style: TextStyle(fontSize: 30, color: Colors.orange),),
                Text( _cube[1].toString(), style: TextStyle(fontSize: 30, color: Colors.green),),
                Text( _cube[2].toString(), style: TextStyle(fontSize: 30, color: Colors.purple),),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
            ),
            alignment: Alignment(0, align+0.09),
          ),

//          stacking plus
          Container(
            child: Row(
              children: <Widget>[
                MaterialButton(
                  minWidth: 130,
                  color: Colors.orange,
                  child: Text("+"),
                  height: 90,
                  onPressed: (){
                    setState(() {
                      updateStack(0, 1);
                    });
                  },
                ),
                MaterialButton(
                  minWidth: 130,
                  color: Colors.green,
                  child: Text("+"),
                  height: 90,
                  onPressed: (){
                    setState(() {
                      updateStack(1, 1);
                    });
                  },
                ),
                MaterialButton(
                  minWidth: 130,
                  color: Colors.purple,
                  child: Text("+"),
                  height: 90,
                  onPressed: (){
                    setState(() {
                      updateStack(2, 1);
                    });
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
            ),
            alignment: Alignment(0, align+0.2),
          ),

//          stacking minus
          Container(
            child: Row(
              children: <Widget>[
                MaterialButton(
                  minWidth: 130,
                  color: Colors.orange,
                  child: Text("-"),
                  height: 90,
                  onPressed: (){
                    setState(() {
                      updateStack(0, -1);
                    });
                  },
                ),
                MaterialButton(
                  minWidth: 130,
                  color: Colors.green,
                  child: Text("-"),
                  height: 90,
                  onPressed: (){
                    setState(() {
                      updateStack(1, -1);
                    });
                  },
                ),
                MaterialButton(
                  minWidth: 130,
                  color: Colors.purple,
                  child: Text("-"),
                  height: 90,
                  onPressed: (){
                    setState(() {
                      updateStack(2, -1);
                    });
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
            ),
            alignment: Alignment(0, align+0.48),
          ),

//          tower values
          Container(
            child: Row(
              children: <Widget>[
                Text((_towers[0]-1).toString(), style: TextStyle(fontSize: 30, color: Colors.orange),),
                Text((_towers[1]-1).toString(), style: TextStyle(fontSize: 30, color: Colors.green),),
                Text((_towers[2]-1).toString(), style: TextStyle(fontSize: 30, color: Colors.purple),),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
            ),
            alignment: Alignment(0, align+0.74),
          ),

//          Towers plus
          Container(
            child: Row(
              children: <Widget>[
                MaterialButton(
                  minWidth: 130,
                  color: Colors.orange,
                  child: Text("+"),
                  height: 90,
                  onPressed: (){
                    setState(() {
                      updateTower(0, 1);
                    });
                  },
                ),
                MaterialButton(
                  minWidth: 130,
                  color: Colors.green,
                  child: Text("+"),
                  height: 90,
                  onPressed: (){
                    setState(() {
                      updateTower(1, 1);
                    });
                  },
                ),
                MaterialButton(
                  minWidth: 130,
                  color: Colors.purple,
                  child: Text("+"),
                  height: 90,
                  onPressed: (){
                    setState(() {
                      updateTower(2, 1);
                    });
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
            ),
            alignment: Alignment(0, align+0.9),
          ),

//          Towers minus
          Container(
            child: Row(
              children: <Widget>[
                MaterialButton(
                  minWidth: 130,
                  color: Colors.orange,
                  child: Text("-"),
                  height: 90,
                  onPressed: (){
                    setState(() {
                      updateTower(0, -1);
                    });
                  },
                ),
                MaterialButton(
                  minWidth: 130,
                  color: Colors.green,
                  child: Text("-"),
                  height: 90,
                  onPressed: (){
                    setState(() {
                      updateTower(1, -1);
                    });
                  },
                ),
                MaterialButton(
                  minWidth: 130,
                  color: Colors.purple,
                  child: Text("-"),
                  height: 90,
                  onPressed: (){
                    setState(() {
                      updateTower(2, -1);
                    });
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
            ),
            alignment: Alignment(0, align+1.18),
          ),

//          timer
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  minWidth: 75,
                  height: 50,
                  color: Colors.lightBlue,
                  onPressed: (){
                    startTimer();
                  },
                  child: Text("Start Timer", style: TextStyle(fontSize: 20),),
                ),
                Text("    $_start", style: TextStyle(fontSize: 30),),
              ],
            ),
            alignment: Alignment(0, align+1.45),
          ),

//          reset button
          Container(
            child: MaterialButton(
              child: Text("Reset scores", style: TextStyle(fontSize: 20),),
              color: Colors.lightBlue,
              height: 50,
              onPressed: (){
                resetScore();
              },
            ),
            alignment: Alignment(0, align+1.60),
          ),

//          score delta for each color
          Container(
            child: Row(
              children: <Widget>[
                Text(_scores[0].toString(), style: TextStyle(fontSize: 30, color: Colors.orange),),
                Text(_scores[1].toString(), style: TextStyle(fontSize: 30, color: Colors.green),),
                Text(_scores[2].toString(), style: TextStyle(fontSize: 30, color: Colors.purple),),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
            ),
            alignment: Alignment(0, align+1.72),
          ),

//          total delta score
          Container(
            child: Text((_scores[0] + _scores[1] + _scores[2]).toString(),style: TextStyle(fontSize: 30,),),
            alignment: Alignment(0, align+1.82),
          ),


        ],
      ),
    );
  }
}
