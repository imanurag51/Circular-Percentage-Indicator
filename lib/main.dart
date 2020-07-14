import 'package:flutter/material.dart';
import 'CircleProgress.dart';

void main() => runApp(app());

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  AnimationController progressControler;
  Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progressControler = AnimationController(vsync: this,duration: Duration(milliseconds: 2000));
    animation = Tween<double>(begin: 0,end: 100).animate(progressControler)..addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: CustomPaint(
          foregroundPainter: CircleProgress(animation.value),
          child: Container(
            height: 200,
            width: 200,
            child: GestureDetector(
              onTap: (){
                if(animation.value ==100){
                  progressControler.reverse();
                }else{
                  progressControler.forward();
                }
              },
                child: Center(
                    child: Text('${animation.value.toInt()}%',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}

