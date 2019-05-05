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

  int _counter = 0;
//  by default, false is blue
  bool alliance = false;

  int redOrange = 0;
  int redGreen  = 0;
  int redPurple = 0;

  int blueOrange = 0;
  int blueGreen  = 0;
  int bluePurple = 0;

//  high scored cubes
  int highOrange = 0;
  int highGreen  = 0;
  int highPurple = 0;

  void hold() {
    print("press");
  }

//  CALCULATE BLUE ALLIANCE SCORE
  int blueScore(){
    return highOrange*blueOrange + highGreen*blueGreen + highPurple+bluePurple;
  }
//  CALCULATE RED ALLIANCE SCORE
  int redScore(){
    return highOrange*redOrange + highGreen*redGreen + highPurple+redPurple;
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
//              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Alliance Color Selector (blue is default)", style: new TextStyle(fontSize: 21),),
                Checkbox(
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
            child: Text("Red Alliance Cubes", style: new TextStyle(fontSize: 19),)
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
                       redOrange+=1;
                     },
                  ),
               ),
               Expanded(
                 child:MaterialButton(
                   color: Colors.green,
                   child: Text("+", style: new TextStyle(fontSize: 20)),
                   onPressed: (){
                     redGreen+=1;
                   },
                 ),
               ),
               Expanded(
                 child:MaterialButton(
                   color: Colors.purple,
                   child: Text("+", style: new TextStyle(fontSize: 20)),
                   onPressed: (){
                     redPurple+=1;
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
                      redOrange-=1;
                    },
                  ),
                ),
                Expanded(
                  child:MaterialButton(
                    color: Colors.green,
                    child: Text("-", style: new TextStyle(fontSize: 20)),
                    onPressed: (){
                      redGreen-=1;
                    },
                  ),
                ),
                Expanded(
                  child:MaterialButton(
                    color: Colors.purple,
                    child: Text("-", style: new TextStyle(fontSize: 20)),
                    onPressed: (){
                      redPurple-=1;
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
                  child: Text("Orange Cubes: " + redOrange.toString())
                ),
                Expanded(
                    child: Text("Green Cubes: " + redGreen.toString())
                ),
                Expanded(
                    child: Text("Purple Cubes: " + redPurple.toString())
                ),
              ],
            ),
          ),

//          BLUE CUBES
          Container(
              alignment: Alignment(0, b),
              child: Text("Blue Alliance Cubes", style: new TextStyle(fontSize: 19),)
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
                    onPressed: hold,
                  ),
                ),
                Expanded(
                  child:MaterialButton(
                    color: Colors.green,
                    child: Text("+", style: new TextStyle(fontSize: 20)),
                    onPressed: hold,
                  ),
                ),
                Expanded(
                  child:MaterialButton(
                    color: Colors.purple,
                    child: Text("+", style: new TextStyle(fontSize: 20)),
                    onPressed: hold,
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
                    onPressed: hold,
                  ),
                ),
                Expanded(
                  child:MaterialButton(
                    color: Colors.green,
                    child: Text("-", style: new TextStyle(fontSize: 20)),
                    onPressed: hold,
                  ),
                ),
                Expanded(
                  child:MaterialButton(
                    color: Colors.purple,
                    child: Text("-", style: new TextStyle(fontSize: 20)),
                    onPressed: hold,
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
                    child: Text("Orange Cubes: " + blueOrange.toString())
                ),
                Expanded(
                    child: Text("Green Cubes: " + blueGreen.toString())
                ),
                Expanded(
                    child: Text("Purple Cubes: " + bluePurple.toString())
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
