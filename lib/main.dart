import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  double b = -.53;

//  by default, false is blue
  bool alliance = false;

  List highValues = List<List<bool>>.generate(7, (i) => List<bool>.generate(3, (j) => false));
  double checkWidth = 45;

//  blueOrange, blueGreen, bluePurple, redOrange, redGreen, redPurple
  List cubeValues = [0, 0, 0, 0, 0, 0];

//  orange, green, purple
  List highCubes = [1,1,1];

//  CALCULATE BLUE ALLIANCE SCORE
  int blueScore(){
    return highCubes[0]*cubeValues[0] + highCubes[1]*cubeValues[1] + highCubes[2]*cubeValues[2];
  }
//  CALCULATE RED ALLIANCE SCORE
  int redScore(){
    return highCubes[0]*cubeValues[3] + highCubes[1]*cubeValues[4] + highCubes[2]*cubeValues[5];
  }

  List _cube = [0,0,0,0,0,0];
  int _blueScore = 0;
  int _redScore  = 0;
  //i is the index in getCubes()
  void _updateText(int i){
    setState(() {
      _cube = cubeValues;
      _blueScore = blueScore();
      _redScore  = redScore();
    });
  }

  void highSwitch(int i, int c, bool value){
    List a = [0,1,2];
    a.remove(c);
    if(!highValues[i][c]){
      highCubes[c] += 1;
      if(highValues[i][a[0]]) {
        highValues[i][a[0]] = false;
        highCubes[a[0]] -= 1;
      }
      if(highValues[i][a[1]]) {
        highValues[i][a[1]] = false;
        highCubes[a[1]] -= 1;
      }
    }
    else if(highValues[i][c]){
      highCubes[c] -= 1;}
    highValues[i][c] = value;
    _updateText(0);
  }

  Widget highCheckBox(int i){
    return Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Color(0xFF000000)),
            left: BorderSide(width: 1.0, color: Color(0xFF000000)),
            right: BorderSide(width: 1.0, color: Color(0xFF000000)),
            bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
          ),
        ),
      child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: checkWidth,
          child: Checkbox(
            activeColor: Colors.orange,
            value: highValues[i][0],
            onChanged: (bool value) {
              setState(() {
                highSwitch(i, 0, value);
              });
            },
          ),
        ),
        SizedBox(
          width: checkWidth,
          child: Checkbox(
            activeColor: Colors.green,
            value: highValues[i][1],
            onChanged: (bool value) {
              setState(() {
                highSwitch(i, 1, value);
              });
            },
          ),
        ),
        SizedBox(
          width: checkWidth,
          child: Checkbox(
            activeColor: Colors.purple,
            value: highValues[i][2],
            onChanged: (bool value) {
              setState(() {
                highSwitch(i, 2, value);
              });
            },
          )
        ),

      ]
    )
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: new Stack(
        children: <Widget>[

//         ALLIANCE COLOR SELECTION
          Container(
            alignment: Alignment(0.1, -0.95),
            child: Row(
              children: <Widget>[
                Text("Color Selector (blue is default)", style: new TextStyle(fontSize: 21),),
                Checkbox(
                  activeColor: Colors.red,
                  value: alliance,
                  onChanged: (bool value) {
                    setState(() {
                      alliance = value;
                      print(alliance);
                    });
                  },
                ),
              ],
            ),
          ),
//          RED CUBES
          Container(
            alignment: Alignment(0, -0.82),
            child: Text("Red Score: " + _redScore.toString(), style: new TextStyle(fontSize: 19),)
          ),
//          ADDING
          Container(
            alignment: Alignment(0, -0.75),
            child: Row(
              children: <Widget>[
               Expanded(
                  child:MaterialButton(
                    color: Colors.orange,
                    child: Text("+", style: new TextStyle(fontSize: 20)),
                    onPressed: (){
                      cubeValues[3]+=1;
                      _updateText(3);
                    },
                  ),
               ),
               Expanded(
                 child:MaterialButton(
                   color: Colors.green,
                   child: Text("+", style: new TextStyle(fontSize: 20)),
                   onPressed: (){
                     cubeValues[4]+=1;
                     _updateText(4);
                   },
                 ),
               ),
               Expanded(
                 child:MaterialButton(
                   color: Colors.purple,
                   child: Text("+", style: new TextStyle(fontSize: 20)),
                   onPressed: (){
                     cubeValues[5]+=1;
                     _updateText(5);
                   },
                 ),
               ),
              ],
            ),
          ),
//          SUBTRACTING
          Container(
            alignment: Alignment(0, -0.68),
            child: Row(
              children: <Widget>[
                Expanded(
                  child:MaterialButton(
                    color: Colors.orange,
                    child: Text("-", style: new TextStyle(fontSize: 20)),
                    onPressed: (){
                      cubeValues[3]-=1;
                      _updateText(3);
                    },
                  ),
                ),
                Expanded(
                  child:MaterialButton(
                    color: Colors.green,
                    child: Text("-", style: new TextStyle(fontSize: 20)),
                    onPressed: (){
                      cubeValues[4]-=1;
                      _updateText(4);
                    },
                  ),
                ),
                Expanded(
                  child:MaterialButton(
                    color: Colors.purple,
                    child: Text("-", style: new TextStyle(fontSize: 20)),
                    onPressed: (){
                      cubeValues[5]-=1;
                      _updateText(5);
                    },
                  ),
                ),
              ],
            ),
          ),

//          RED NUMBER OF CUBES
          Container(
            alignment: Alignment(0, -.575),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text("Orange Cubes: " + _cube[3].toString())
                ),
                Expanded(
                    child: Text("Green Cubes: " + _cube[4].toString())
                ),
                Expanded(
                    child: Text("Purple Cubes: " + _cube[5].toString())
                ),
              ],
            ),
          ),

//          BLUE CUBES
          Container(
              alignment: Alignment(0, b),
              child: Text("Blue Score: " + _blueScore.toString(), style: new TextStyle(fontSize: 19),)
          ),
//          ADDING
          Container(
            alignment: Alignment(0, b + 0.07),
            child: Row(
              children: <Widget>[
                Expanded(
                  child:MaterialButton(
                    color: Colors.orange,
                    child: Text("+", style: new TextStyle(fontSize: 20)),
                    onPressed: (){
                      cubeValues[0] += 1;
                      _updateText(0);
                    }
                  ),
                ),
                Expanded(
                  child:MaterialButton(
                    color: Colors.green,
                    child: Text("+", style: new TextStyle(fontSize: 20)),
                    onPressed: (){
                      cubeValues[1] += 1;
                      _updateText(1);
                    },
                  ),
                ),
                Expanded(
                  child:MaterialButton(
                    color: Colors.purple,
                    child: Text("+", style: new TextStyle(fontSize: 20)),
                    onPressed: (){
                      cubeValues[2] += 1;
                      _updateText(2);
                    },
                  ),
                ),
              ],
            ),
          ),
//          SUBTRACTING
          Container(
            alignment: Alignment(0, b + .14),
            child: Row(
              children: <Widget>[
                Expanded(
                  child:MaterialButton(
                    color: Colors.orange,
                    child: Text("-", style: new TextStyle(fontSize: 20)),
                    onPressed: (){
                      cubeValues[0] -= 1;
                      _updateText(0);
                    },
                  ),
                ),
                Expanded(
                  child:MaterialButton(
                    color: Colors.green,
                    child: Text("-", style: new TextStyle(fontSize: 20)),
                    onPressed: (){
                      cubeValues[1] -= 1;
                      _updateText(1);
                    },
                  ),
                ),
                Expanded(
                  child:MaterialButton(
                    color: Colors.purple,
                    child: Text("-", style: new TextStyle(fontSize: 20)),
                    onPressed: (){
                      cubeValues[2] -= 1;
                      _updateText(2);
                    },
                  ),
                ),
              ],
            ),
          ),

//         BLUE NUMBER CUBES
          Container(
            alignment: Alignment(0, b+.245),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text("Orange Cubes: " + _cube[0].toString())
                ),
                Expanded(
                    child: Text("Green Cubes: " + _cube[1].toString())
                ),
                Expanded(
                    child: Text("Purple Cubes: " + _cube[2].toString())
                ),
              ],
            ),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(height: 100),
                  highCheckBox(0),
                  Container(height: 50),
                  highCheckBox(1),
                ]
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  highCheckBox(2),
                  highCheckBox(3),
                  highCheckBox(4),
                ]
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(height: 100),
                  highCheckBox(5),
                  Container(height: 50),
                  highCheckBox(6),
                ]
              ),
            ],
          ),



        ],
      ),
    );
  }
}
